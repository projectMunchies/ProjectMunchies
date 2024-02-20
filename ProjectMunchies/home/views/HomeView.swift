//
//  HomeView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/27/23.
//

import SwiftUI
import MapKit

struct HomeView: View {
    @StateObject private var homeViewModel = HomeViewModel()
    @StateObject private var reviewsViewModel = ReviewsViewModel()
    @StateObject private var specialsViewModel = SpecialsViewModel()
    
    @Binding var searchText: String
    @Binding var startSearch: Bool
    @Binding var position: MapCameraPosition
    
    @State private var scale: CGFloat = 0.5
    @State private var searchResults: [MKMapItem] = []
    @State private var showModal: Bool = false
    @State private var navbarIndex: Int = 0
    @State private var filterLvlOneIndices: [Int] = []
    @State private var filterLvlTwoIndices: [Int] = []
    @State private var showVenueFilter: Bool = false
    @State private var currentVenue: VenueModel = emptyVenue
    @State private var venues: [VenueModel] = []
    @State private var route: MKRoute?
    @State private var travelTime: String?
    @State private var selectedView: Int?
    @State private var indentLow: Int = 90
    @State private var indentHigh: Int = 90
    @State private var showBottomNavBar: Bool = false
    @State private var newSpecials: [SpecialModel] = []
    @State private var useMapAlerts: Bool = true
    @State private var status: [Bool] = []
    @State private var timerCount: Int = 0
    @State private var sheetHeight: CGFloat = .zero
    @State private var isExpanded: Bool = false
    @State private var searchTextFoodOptions: [String] = ["mexican food","american food","indian food", "japanese food","italian food"]
    @State private var searchTextDrinkOptions: [String] = ["Juice","Smoothie","Soda", "Coffee"]
    @State private var searchTextNightSpotsOptions: [String] = ["","",""]
    @State private var nightSpots: [CLLocationCoordinate2D] = [CLLocationCoordinate2D(
        latitude: 27.9416957,
        longitude: -82.4853619
    ),CLLocationCoordinate2D(
        latitude: 27.9432414,
        longitude: -82.4503545
    ),CLLocationCoordinate2D(
        latitude: 27.9937694,
        longitude: -82.6449753
    ),CLLocationCoordinate2D(
        latitude: 27.9505663,
        longitude: -82.463508
    ),CLLocationCoordinate2D(
        latitude: 27.9448659,
        longitude: -82.4614819
    ),CLLocationCoordinate2D(
        latitude: 27.9523886,
        longitude: -82.462625
    )]
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 27.9506,
            longitude: -82.4572
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.001,
            longitudeDelta: 0.001
        )
    )
    
    var delay: Double = 0
    private let gradient = LinearGradient(colors: [.red, .orange], startPoint: .leading, endPoint: .trailing)
    private let stroke = StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, dash: [8, 8])
    
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader{ geoReader in
            ZStack{
                Color.black
                    .ignoresSafeArea()
                ScrollViewReader{ scrollReader in
                    ZStack{
                        displayMap(for: geoReader, scrollReader: scrollReader)
                            .position(x: geoReader.frame(in: .local).midX, y: geoReader.size.height * 0.5)
                        
                        subHeaderSection(for: geoReader)
                            .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.02)
                        
                        //                        displayVenues(for: geoReader)
                        //                            .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.7)
                    }
                    .onAppear{
                        self.showBottomNavBar.toggle()
                        getUserProfile()
                        checkForNewMapAlerts()
                    }
                    .onChange(of: startSearch) {
                        if self.startSearch {
                            //clean if dirty
                            self.venues.removeAll()
                            searchForVenues(query: self.searchText)
                        }
                    }
                    .onChange(of: searchText) {
                        if self.searchText == "" {
                            self.venues.removeAll()
                        }
                    }
                }
            }
            .sheet(isPresented: .constant(true)) {
                displayFilterSheet(geoReader: geoReader)
                    .presentationDetents([.height(CGFloat(indentLow)),.height(CGFloat(indentHigh))])
                    .presentationDragIndicator(.visible)
                    .presentationBackgroundInteraction(
                        .enabled(upThrough: .height(CGFloat(indentHigh))))
                    .interactiveDismissDisabled()
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
    
    private func subHeaderSection(for geoReader: GeometryProxy) -> some View {
        HStack {
            Header()
        }
    }
    
    private func displayMap(for geoReader: GeometryProxy, scrollReader: ScrollViewProxy ) -> some View {
        Map(position: $position) {
            ForEach(self.venues) { venue in
                Annotation("", coordinate: venue.coordinates) {
                    ZStack{
                        if self.useMapAlerts {
                            displayMapAlerts(geoReader: geoReader, venue: venue, index: self.venues.firstIndex(of: venue)!)
                        } else {
                            Image(systemName: "mappin.circle.fill")
                                .resizable()
                                .frame(width: geoReader.size.width * 0.07, height: geoReader.size.height * 0.04)
                                .foregroundColor(.orange)
                        }
                    }
                    .onTapGesture {
                        self.showBottomNavBar.toggle()
                        self.status[self.venues.firstIndex(of: venue)!].toggle()
                        
                        if self.showBottomNavBar {
                            self.indentLow = 90
                            self.indentHigh = 90
                        } else {
                            self.indentLow = 200
                            self.indentHigh = 800
                            currentVenue = venue
                        }
                        //                        scrollReader.scrollTo(currentVenue.id, anchor: .center)
                    }
                }
            }
        }
        .onMapCameraChange { mapCameraUpdateContext in
            self.region = mapCameraUpdateContext.region
        }
        .preferredColorScheme(.dark)
        .cornerRadius(30)
        .frame(width: geoReader.size.width * 1.0, height: geoReader.size.height * 1.5)
    }
    
    private func displayVenues(for geoReader: GeometryProxy) -> some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(venues) { venue in
                    ZStack{
                        Text("")
                            .frame(width: geoReader.size.width * 0.6, height: geoReader.size.height * 0.2)
                            .foregroundColor(.white)
                            .background(Color("MainColor").opacity(0.7))
                            .cornerRadius(30)
                            .overlay(
                                VStack{
                                    Text(venue.name)
                                        .font(.title2)
                                        .bold()
                                    Text(venue.address)
                                        .font(.system(size: 15))
                                }
                            )
                    }
                }
            }
        }
    }
    
    public func searchForVenues(query: String, mapAlertVenue: VenueModel = emptyVenue) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.resultTypes = .pointOfInterest
        request.region = self.region
        Task {
            let search = MKLocalSearch(request: request)
            let response = try? await search.start()
            searchResults = response?.mapItems ?? []
            
            for result in searchResults {
                // if venue is empty
                if mapAlertVenue.id == "" {
                    let venue = VenueModel(id: UUID().uuidString, name: result.name ?? "", coordinates: result.placemark.coordinate, address: result.placemark.title ?? "", reviews: [], specials: [])
                    self.venues.append(venue)
                } else {
                    var newMapAlertVenue = mapAlertVenue
                    newMapAlertVenue.coordinates = result.placemark.coordinate
                    self.venues.removeAll(where: { $0.id == mapAlertVenue.id })
                    self.venues.append(newMapAlertVenue)
                }
            }
            
        }
        self.startSearch = false
    }
    
    private func fetchRouteFrom(_ source: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D) {
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: source))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination))
        request.transportType = .automobile
        
        Task {
            let result = try? await MKDirections(request: request).calculate()
            route = result?.routes.first
            getTravelTime()
        }
    }
    
    private func getTravelTime() {
        guard let route else { return }
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.hour, .minute]
        travelTime = formatter.string(from: route.expectedTravelTime)
    }
    
    private func displayFilterSheet(geoReader: GeometryProxy) -> some View {
        VStack{
            ScrollView(.horizontal, showsIndicators: false) {
                Spacer()
                    .frame(width: geoReader.size.width)
                
                HStack{
                    if self.showBottomNavBar {
                        ForEach(bottomIcons) { icon in
                            Button(action: {
                                if navbarIndex == icon.id {
                                    navbarIndex = 0
                                    filterLvlOneIndices.removeAll()
                                  
                                } else {
                                    navbarIndex = icon.id
                                   // self.searchText = icon.name
                                }
                            }){
                                VStack{
                                    ZStack{
                                        Circle()
                                            .foregroundColor(self.navbarIndex == icon.id ? .green : .gray)
                                            .frame(width: geoReader.size.width * 0.3, height: geoReader.size.height * 0.07)
                                        
                                        Image(icon.icon)
                                            .resizable()
                                            .frame(width: geoReader.size.width * 0.09, height: geoReader.size.height * 0.04)
                                            .font(.system(size: 35))
                                            .foregroundColor(.black)
                                    }
                                    Text(icon.name)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                    else {
                        detailsView(geoReader: geoReader, venue: currentVenue)
                    }
                }
            }
            .padding(.top, self.indentLow == 90 ?
                     geoReader.size.height * 0.02 : navbarIndex == 2 ?
                     geoReader.size.height * 0.02 : geoReader.size.height * 0.05)
            .onChange(of: navbarIndex) {
                if navbarIndex == 0 {
                    self.indentLow = 90
                    self.indentHigh = 90
                } else if navbarIndex == 1 {
                    self.indentLow = 300
                    self.indentHigh = 300
                } else {
                    self.indentLow = 300
                    self.indentHigh = 300
                }
            }
            if navbarIndex != 0 {
                if navbarIndex == 1 {
                    displayFilter(geoReader: geoReader)
                }
                
                if navbarIndex == 2 {
                    Divider()
                    
                    VStack{
                        HStack{
                            Text("Recent Reviews")
                            .font(.title)
                            
                            Button(action: {
                                if self.isExpanded {
                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        self.indentLow = 300
                                        self.indentHigh = 300
                                        self.isExpanded.toggle()
                                                       }
                                } else {
                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        self.indentLow = 800
                                        self.indentHigh = 800
                                        self.isExpanded.toggle()
                                                       }
                                }
                            }){
                                if self.isExpanded {
                                    Image(systemName: "x.circle.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.gray)
                                } else {
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 15.0)
                                            .frame(width: 80, height: 40)
                                            .foregroundColor(Color("MainColor"))
                                        
                                        Text("Expand")
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                        }
                        
                        ScrollView {
                            ForEach(0..<5, id:\.self) { item in
                                Button(action: {
                                    
                                }){
                                    ZStack{
                                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                            .frame(width: 370, height: self.isExpanded ? 150 : 50)
                                            .foregroundColor(Color("MainColor"))
                                            
                                        
                                        Text("this is s atest snste tes fjsd ghjg...")
                                            .foregroundColor(.green)
                                    }
                                }
                            }
                        }
                        .frame(height: self.isExpanded ? geoReader.size.height * 0.77 : geoReader.size.height * 0.18)
                    }
                }
                
                if navbarIndex == 3 {
                    VStack{
                        Text("What should I eat today?")
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                        
                        RecommendationModal(showModal: $showModal, startSearch: $startSearch, searchText: $searchText, position: $position, showVenueFilter: $showVenueFilter, venue: $currentVenue)
                    }
                }
            }
        }
    }
    
    private func displayFilter(geoReader: GeometryProxy) -> some View {
        VStack{
            getFilterLvlOne(geoReader: geoReader)
            
            if !filterLvlOneIndices.isEmpty {
                getFilterLvlTwo(geoReader: geoReader)
            }
            
            Button(action: {
                self.searchText = "chipotle"
                startSearch.toggle()
                self.useMapAlerts = false
                self.indentLow = 90
                self.indentHigh = 90
                self.navbarIndex = 0
                self.filterLvlOneIndices.removeAll()
            }){
                ZStack{
                    Text("")
                        .frame(width: 350, height: 60)
                        .background(.gray)
                        .cornerRadius(30)
                    
                    Text("Search")
                        .foregroundColor(.white)
                }
            }
            .padding(.top)
        }
        .onChange(of: filterLvlOneIndices) {
            if !filterLvlOneIndices.isEmpty {
                self.indentLow = 500
                self.indentHigh = 500
            } else {
                self.indentLow = 300
                self.indentHigh = 300
            }
        }
    }
    
    private func detailsView(geoReader: GeometryProxy, venue: VenueModel) -> some View {
        VStack{
            if !venue.specials.isEmpty && venue.reviews.isEmpty {
                newSpecialView(venue: venue)
            } else if venue.specials.isEmpty && !venue.reviews.isEmpty {
                newReviewView(venue: venue)
            } else if !venue.specials.isEmpty && !venue.reviews.isEmpty  {
                newSpecialView(venue: venue)
                newReviewView(venue: venue)
            }
        }
    }
    
    private func displayMapAlerts(geoReader: GeometryProxy, venue: VenueModel, index: Int) -> some View {
        ZStack{
            if !venue.specials.isEmpty && !venue.reviews.isEmpty {
                VStack{
                    Text("New!")
                        .bold()
                        .font(.system(size: 15))
                        .foregroundColor(.yellow)
                    
                    PacmanAnimation()
                        .particleEffect(systemImage: "suit.heart.fill", font: .largeTitle, status: self.status[index], activeTint: .blue, inActiveTint: .red)
                }
            } else if !venue.specials.isEmpty  {
                VStack{
                    Text("New \nSpecial")
                        .bold()
                        .font(.system(size: 15))
                        .foregroundColor(.orange)
                    
                    SpinningView()
                        .particleEffect(systemImage: "suit.heart.fill", font: .largeTitle, status: self.status[index], activeTint: .yellow, inActiveTint: .red)
                }
                
            }else if !venue.reviews.isEmpty  {
                VStack{
                    Text("New \nReview")
                        .bold()
                        .font(.system(size: 15))
                        .foregroundColor(.pink)
                    
                    ZStack{
                        Circle()
                            .foregroundColor(.pink)
                            .scaleEffect(scale)
                            .animation(
                                Animation.easeInOut(duration: 0.6)
                                    .repeatForever().delay(delay), value: scale
                            )
                            .onAppear {
                                self.scale = 1
                            }
                        Text("1")
                    }
                    .particleEffect(systemImage: "suit.heart.fill", font: .largeTitle, status: self.status[index], activeTint: .red, inActiveTint: .red)
                    .onReceive(timer) { time in
                        if self.timerCount < 4 {
                            //particel animation for all venues
                            for idx in self.status.indices {
                                self.status[idx].toggle()
                            }
                            timerCount += 1
                        }
                    }
                    .frame(width: geoReader.size.width * 0.10, height: geoReader.size.width * 0.10)
                }
            }
        }
    }
    
    private func newSpecialView(venue: VenueModel) -> some View {
        HStack{
            VStack{
                Text("New Specials")
                    .font(.system(size: 50))
                    .foregroundColor(.yellow)
                
                Text("\(venue.name)")
                    .font(.title3)
                    .foregroundColor(.gray)
                
                ZStack{
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .frame(width: 200, height: 100)
                        .overlay{
                            Image("greenLemon")
                                .resizable()
                                .frame(width: 200, height: 100)
                                .scaledToFill()
                                .opacity(0.5)
                        }
                }
            }
            
            Button(action: {
                self.showBottomNavBar.toggle()
                self.indentLow = 90
                currentVenue = emptyVenue
            }){
                Image(systemName: "x.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.gray)
            }
        }
    }
    
    private func newReviewView(venue: VenueModel) -> some View {
        HStack{
            VStack{
                Text("New Reviews")
                    .font(.system(size: 50))
                    .foregroundColor(.yellow)
                
                Text("\(venue.name)")
                    .font(.title3)
                    .foregroundColor(.gray)
                
                ZStack{
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .frame(width: 200, height: 100)
                        .overlay{
                            Image("greenLemon")
                                .resizable()
                                .frame(width: 200, height: 100)
                                .scaledToFill()
                                .opacity(0.5)
                        }
                }
            }
            
            Button(action: {
                self.showBottomNavBar.toggle()
                self.indentLow = 80
                currentVenue = emptyVenue
            }){
                Image(systemName: "x.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.gray)
            }
        }
    }
    
    private func getUserProfile() {
        homeViewModel.getUserProfile() {(userProfileId) -> Void in
            if userProfileId != "" {
                //get profileImage
                homeViewModel.getImageStorageFile(profileId: userProfileId)
            } else {
                homeViewModel.createUserProfile() {(newUserProfileId) -> Void in
                    if newUserProfileId != "" {
                        //add a popover to add images in the future
                    }
                }
            }
        }
    }
    
    private func checkForNewMapAlerts() {
        reviewsViewModel.getAllNewReviews {(newReviews) -> Void in
            specialsViewModel.getAllNewSpecials {(newSpecials) -> Void in
                if !newReviews.isEmpty || !newSpecials.isEmpty {
                    getVenuesForMapAlerts(newReviews: newReviews, newSpecials: newSpecials)
                }
            }
        }
    }
    
    private func getVenuesForMapAlerts(newReviews: [ReviewModel], newSpecials: [SpecialModel]) {
        reviewsViewModel.getReviewsVenues(newReviews: newReviews) {(reviewsVenues) -> Void in
            specialsViewModel.getSpecialsVenues(newSpecials: newSpecials) {(specialsVenues) -> Void in
                if !reviewsVenues.isEmpty || !specialsVenues.isEmpty {
                    combineVenues(reviewsVenues: reviewsVenues,specialsVenues: specialsVenues)
                    // append for particle animation
                    for _ in self.venues {
                        self.status.append(false)
                    }
                    for mapAlertVenue in self.venues {
                        searchForVenues(query: mapAlertVenue.address,mapAlertVenue: mapAlertVenue)
                    }
                }
            }
        }
    }
    
    private func combineVenues(reviewsVenues: [VenueModel], specialsVenues : [VenueModel]) {
        for reviewVenue in reviewsVenues {
            self.venues.append(reviewVenue)
        }
        
        for specialVenue in specialsVenues {
            let isMatchingVenue =  self.venues.contains(where: {$0.id == specialVenue.id})
            
            if isMatchingVenue {
                var matchingVenue =  self.venues.first(where: {$0.id == specialVenue.id})
                //merge specials and reviews to same venue
                matchingVenue?.specials.append(contentsOf: specialVenue.specials)
                //remove the original venues from array
                self.venues.removeAll(where: {$0.id == matchingVenue?.id})
                //add merged venue
                self.venues.append(matchingVenue!)
            } else {
                self.venues.append(specialVenue)
            }
        }
    }
    
    private func getFilterLvlOne(geoReader: GeometryProxy) -> some View {
        VStack{
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(filterLvlOne) { filterIcon in
                        Button(action: {
                            if filterLvlOneIndices.contains(filterIcon.id) {
                                let index = filterLvlOneIndices.firstIndex(of: filterIcon.id)
                                filterLvlOneIndices.remove(at: index!)
                            } else {
                                filterLvlOneIndices.append(filterIcon.id)
                            }
                            
                        }){
                            VStack{
                                ZStack{
                                    Circle()
                                        .foregroundColor(self.filterLvlOneIndices.contains(filterIcon.id) ? .green : .gray)
                                        .frame(width: geoReader.size.width * 0.3, height: geoReader.size.height * 0.07)
                                    
                                    if navbarIndex != 0 {
                                        Image(filterIcon.icon)
                                            .resizable()
                                            .frame(width: geoReader.size.width * 0.09, height: geoReader.size.height * 0.04)
                                    }
                                }
                                
                                if navbarIndex != 0 {
                                    Text(filterIcon.name)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                }
            }
            .padding(.leading,geoReader.size.width * 0.03)
            .padding(.top,geoReader.size.height * 0.03)
        }
    }
    
    private func getFilterLvlTwo(geoReader: GeometryProxy) -> some View {
        LazyVStack{
            ScrollView{
                if filterLvlOneIndices.contains(where: {$0 == 1}) {
                    Divider()
                        .background(.white)
                        .padding(.top,geoReader.size.height * 0.02)
                    
                    getSpecialsFilter(geoReader: geoReader)
                }
                
                if filterLvlOneIndices.contains(where: {$0 == 2}) {
                    Divider()
                        .background(.white)
                        .padding(.top,geoReader.size.height * 0.02)
                    
                    getPortionsFilter(geoReader: geoReader)
                }
            }
            .frame(height: geoReader.size.height * 0.3)
            
        }
    }
    
    private func getSpecialsFilter(geoReader: GeometryProxy) -> some View {
        VStack{
            Text("Specials")
                .bold()
                .foregroundColor(.white)
                .font(.title2)
                .padding(.trailing,geoReader.size.width * 0.7)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(filterSpecialsLvl) { filterIcon in
                        Button(action: {
                            filterLvlTwoIndices.append(filterIcon.id)
                        }){
                            VStack{
                                ZStack{
                                    Circle()
                                        .foregroundColor(self.filterLvlTwoIndices.contains(filterIcon.id) ? .green : .gray)
                                        .frame(width: geoReader.size.width * 0.3, height: geoReader.size.height * 0.07)
                                    
                                    if navbarIndex != 0 {
                                        Image(filterIcon.icon)
                                            .resizable()
                                            .frame(width: geoReader.size.width * 0.09, height: geoReader.size.height * 0.04)
                                    }
                                }
                                
                                if navbarIndex != 0 {
                                    Text(filterIcon.name)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                }
            }
            .padding(.leading,geoReader.size.width * 0.03)
            .padding(.top,geoReader.size.height * 0.02)
        }
    }
    
    private func getPortionsFilter(geoReader: GeometryProxy) -> some View {
        VStack{
            Text("Portions")
                .bold()
                .foregroundColor(.white)
                .font(.title2)
                .padding(.trailing,geoReader.size.width * 0.7)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(filterSpecialsLvl) { filterIcon in
                        Button(action: {
                            filterLvlTwoIndices.append(filterIcon.id)
                        }){
                            VStack{
                                ZStack{
                                    Circle()
                                        .foregroundColor(self.filterLvlTwoIndices.contains(filterIcon.id) ? .green : .gray)
                                        .frame(width: geoReader.size.width * 0.3, height: geoReader.size.height * 0.07)
                                    
                                    if navbarIndex != 0 {
                                        Image(filterIcon.icon)
                                            .resizable()
                                            .frame(width: geoReader.size.width * 0.09, height: geoReader.size.height * 0.04)
                                    }
                                }
                                
                                if navbarIndex != 0 {
                                    Text(filterIcon.name)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                }
            }
            .padding(.leading,geoReader.size.width * 0.03)
            .padding(.top,geoReader.size.height * 0.02)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(searchText: .constant(""), startSearch: .constant(false), position: .constant(MapCameraPosition.region (MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 27.9506,
                longitude: -82.4572
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 0.1,
                longitudeDelta: 0.1
            )
        ))))
    }
}
