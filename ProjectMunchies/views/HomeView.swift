//
//  HomeView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/27/23.
//

import SwiftUI
import MapKit

struct HomeView: View {
    @StateObject private var profilesViewModel = ProfilesViewModel()
    @StateObject private var reviewsViewModel = ReviewsViewModel()
    @StateObject private var specialsViewModel = SpecialsViewModel()
    
    @Binding var searchText: String
    @Binding var startSearch: Bool
    @Binding var position: MapCameraPosition
    
    @State private var scale: CGFloat = 0.5
    @State private var delay: Double = 0
    @State private var searchResults: [MKMapItem] = []
    @State private var showModal: Bool = false
    @State private var navbarIndex: Int = 0
    @State private var filterLvlOneIndices: [Int] = []
    @State private var filterLvlTwoIndices: [Int] = []
    @State private var showVenueFilter: Bool = false
    @State private var currentVenue: VenueModel = emptyVenueModel
    @State private var venues: [VenueModel] = []
    @State private var route: MKRoute?
    @State private var travelTime: String?
    @State private var indentLow: Int = 90
    @State private var indentHigh: Int = 90
    @State private var showBottomNavBar: Bool = false
    @State private var newSpecials: [SpecialModel] = []
    @State private var useMapAlerts: Bool = true
    @State private var status: [Bool] = []
    @State private var timerCount: Int = 0
    @State private var sheetHeight: CGFloat = .zero
    @State private var isExpanded: Bool = false
    @State private var selectedTab: TabModel?
    @State private var tabProgress: CGFloat = 0.5
    @State private var selectedView: Int?
    @State private var isOverlayDisplayed: Bool = false
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
    
    private let gradient = LinearGradient(colors: [.red, .orange], startPoint: .leading, endPoint: .trailing)
    private let stroke = StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, dash: [8, 8])
    
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader{ geoReader in
            ZStack{
                Color.black
                    .ignoresSafeArea()
                ScrollView {
                    ZStack{
                        displayMap(for: geoReader)
                            .position(x: geoReader.frame(in: .local).midX, y: geoReader.size.height * 0.5)
                        
                        subHeaderSection(for: geoReader)
                            .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.02)
                    }
                    .onAppear{
                     //   self.isOverlayDisplayed.toggle()
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
                .blur(radius: isOverlayDisplayed ? 10 : 0 )
                .overlay {
                    if isOverlayDisplayed {
                        reviewsOverlay(geoReader: geoReader)
                    }
                }
            }
            .sheet(isPresented: .constant(true)) {
                mainSheet(geoReader: geoReader)
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
    
    private func displayMap(for geoReader: GeometryProxy) -> some View {
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
                        // for each marker on the map
                        self.status[self.venues.firstIndex(of: venue)!].toggle()
                        
                        if self.showBottomNavBar {
                            setSheetBoundary(lowestPoint: 90, highestPoint: 90)
                        } else {
                            setSheetBoundary(lowestPoint: 400, highestPoint: 800)
                            currentVenue = venue
                        }
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
    
    public func searchForVenues(query: String, mapAlertVenue: VenueModel = emptyVenueModel) {
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
    
    private func mainSheet(geoReader: GeometryProxy) -> some View {
        VStack{
            
            if self.showBottomNavBar {
                ScrollView(.horizontal, showsIndicators: false) {
                    Spacer()
                        .frame(width: geoReader.size.width)
                    
                    HStack{
                        ForEach(bottomIcons) { icon in
                            navBarIcon(geoReader: geoReader, icon: icon)
                                .disabled(self.isOverlayDisplayed)
                                .opacity(self.isOverlayDisplayed ? 0.2 : 1)
                        }
                    }
                }
                .padding(.top, positionNavBarHeight(geoReader: geoReader))
                
                navBarDetails(geoReader: geoReader)
            } else {
                venueDetails(geoReader: geoReader, venue: currentVenue)
            }
        }
        .onChange(of: navbarIndex) {
            adjustNavBarHeight(navBarIndex: navbarIndex)
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
                setSheetBoundary(lowestPoint: 90, highestPoint: 90)
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
                setSheetBoundary(lowestPoint: 500, highestPoint: 500)
            } else {
                setSheetBoundary(lowestPoint: 300, highestPoint: 300)
            }
        }
    }
    
    private func venueDetails(geoReader: GeometryProxy, venue: VenueModel) -> some View {
        VStack{
            venueDetailsHeader(venue: venue, geoReader: geoReader)
            HStack{
                if !venue.specials.isEmpty && !venue.reviews.isEmpty {
                    newReviewView(venue: venue, geoReader: geoReader, isNew: true)
                    newSpecialView(venue: venue, geoReader: geoReader, isNew: true)
                }
                else if !venue.specials.isEmpty && venue.reviews.isEmpty {
                    newSpecialView(venue: venue, geoReader: geoReader, isNew: true)
                    newReviewView(venue: venue, geoReader: geoReader)
                } else if !venue.reviews.isEmpty && venue.specials.isEmpty {
                    newReviewView(venue: venue, geoReader: geoReader, isNew: true)
                    newSpecialView(venue: venue, geoReader: geoReader)
                }
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
                        PulsingCircle()
                        Text("1")
                            .font(.system(size: 20))
                    }
                    .particleEffect(systemImage: "suit.heart.fill", font: .largeTitle, status: self.status[index], activeTint: .red, inActiveTint: .red)
                    .onReceive(timer) { time in
                        if self.timerCount < 4 {
                            //particle animation for all venues
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
    
    private func venueDetailsHeader(venue: VenueModel, geoReader: GeometryProxy) -> some View {
        VStack{
            HStack{
                Text("Venue")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .padding(.leading)
                
                Spacer()
                
                Button(action: {
                    
                    self.showBottomNavBar.toggle()
                    self.indentLow = 90
                    currentVenue = emptyVenueModel
                }) {
                    VStack(spacing: 0){
                        Circle()
                            .frame(width: geoReader.size.width * 0.02, height: geoReader.size.height * 0.02)
                            .foregroundColor(.white)
                        
                        Circle()
                            .frame(width: geoReader.size.width * 0.02, height: geoReader.size.height * 0.02)
                            .foregroundColor(.white)
                    }
                }
                .padding(.trailing)
                
                
            }
            
            HStack{
                Spacer()
                    .frame(width: geoReader.size.width * 0.06)
                
                Text("\(venue.name)")
                    .font(.system(size: 30))
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: geoReader.size.height * 0.05, height: geoReader.size.height * 0.08)
                    .overlay{
                        Text("5.0")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                    }
                
                Spacer()
                    .frame(width: geoReader.size.width * 0.06)
            }
        }
    }
    private func newSpecialView(venue: VenueModel, geoReader: GeometryProxy, isNew: Bool = false) -> some View {
        VStack{
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: geoReader.size.width * 0.45, height: geoReader.size.width * 0.45)
                .foregroundColor(.white)
                .overlay {
                    VStack{
                        Text("Specials")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                        
                        HStack{
                            Text("3")
                                .font(.system(size: 60))
                                .foregroundColor(.black)
                            
                            
                            if isNew {
                                RoundedRectangle(cornerRadius: 25.0)
                                    .frame(width: geoReader.size.width * 0.1, height: geoReader.size.width * 0.05)
                                    .foregroundColor(.green)
                                    .overlay {
                                        Text("New")
                                            .font(.system(size: 10))
                                            .foregroundColor(.white)
                                    }
                                    .padding(.bottom,40)
                            } else {
                                Text("+")
                                    .font(.system(size: 30))
                                    .foregroundColor(.black)
                                    .padding(.bottom,30)
                            }
                        }
                        
                    }
                    
                }
        }
    }
    
    private func newReviewView(venue: VenueModel, geoReader: GeometryProxy, isNew: Bool = false) -> some View {
        VStack{
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: geoReader.size.width * 0.45, height: geoReader.size.width * 0.45)
                .foregroundColor(.white)
                .overlay {
                    VStack{
                        Text("Reviews")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                        
                        HStack{
                            Text("3")
                                .font(.system(size: 60))
                                .foregroundColor(.black)
                            
                            if isNew {
                                RoundedRectangle(cornerRadius: 25.0)
                                    .frame(width: geoReader.size.width * 0.1, height: geoReader.size.width * 0.05)
                                    .foregroundColor(.green)
                                    .overlay {
                                        Text("New")
                                            .font(.system(size: 10))
                                            .foregroundColor(.white)
                                    }
                                    .padding(.bottom,40)
                            } else {
                                Text("+")
                                    .font(.system(size: 30))
                                    .foregroundColor(.black)
                                    .padding(.bottom,30)
                            }
                        }
                        
                    }
                    
                }
        }
    }
    
    private func getUserProfile() {
        profilesViewModel.getUserProfile() {(userProfileId) -> Void in
            if userProfileId.id != "" {
                //get profileImage
//                profilesViewModel.getImageStorageFile(profileId: userProfileId)
            } else {
                profilesViewModel.createUserProfile()
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
//            specialsViewModel.getSpecialsVenues(newSpecials: newSpecials) {(specialsVenues) -> Void in
////                if !reviewsVenues.isEmpty || !specialsVenues.isEmpty {
////                    combineVenues(reviewsVenues: reviewsVenues,specialsVenues: specialsVenues)
////                    // append for particle animation
////                    for _ in self.venues {
////                        self.status.append(false)
////                    }
////                    for mapAlertVenue in self.venues {
////                        searchForVenues(query: mapAlertVenue.address,mapAlertVenue: mapAlertVenue)
////                    }
////                }
//            }
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
    
    private func checkForLiveReviews() {
        reviewsViewModel.getAllNewReviews {(newReviews) -> Void in
            if !newReviews.isEmpty {
                getVenuesForReviewAlerts(newReviews: newReviews)
            }
        }
    }
    
    private func getVenuesForReviewAlerts(newReviews: [ReviewModel]) {
        reviewsViewModel.getReviewsVenues(newReviews: newReviews) {(reviewsVenues) -> Void in
            if !reviewsVenues.isEmpty {
                for reviewVenue in reviewsVenues {
                    searchForVenues(query: reviewVenue.address,mapAlertVenue: reviewVenue)
                }
            }
        }
    }
    
    private func CustomTabBar() -> some View {
        HStack(spacing: 0) {
            ForEach(TabModel.allCases, id: \.rawValue) { tab in
                HStack(spacing: 10) {
                    Image(systemName: tab.systemImage)
                    
                    Text(tab.rawValue)
                        .font(.callout)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .contentShape(.capsule)
                .onTapGesture {
                    /// Updating Tab
                    withAnimation(.snappy) {
                        selectedTab = tab
                    }
                }
            }
        }
        /// Scrollable Active Tab Indicator
        .background {
            GeometryReader {
                let size = $0.size
                let capsuleWidth = size.width / CGFloat(TabModel.allCases.count)
                
                Capsule()
                    .fill(.black)
                    .frame(width: capsuleWidth)
                    .offset(x: tabProgress * (size.width - capsuleWidth))
            }
        }
        .padding(.horizontal, 15)
    }
    
    private func SampleView(_ color: Color) -> some View {
        GeometryReader{ proxy in
            ScrollView(.vertical) {
                LazyVGrid(columns: Array(repeating: GridItem(), count: 1), content: {
                    ForEach(liveReviewSamples, id: \.self) { reviewSample in
                        RoundedRectangle(cornerRadius: 15)
                            .fill(color.gradient)
                            .frame(height: self.isExpanded ? 150 : 50)
                            .overlay {
                                if self.isExpanded {
                                    VStack{
                                        Menu {
                                            Button(action: {
                                                selectedView = 0
                                            }) {
                                                Label("Go to Venue", systemImage: "person.2.square.stack")
                                            }
                                            
                                            Button(action: {
                                                selectedView = 1
                                            }) {
                                                Label("Minimize", systemImage: "star.fill")
                                            }
                                            
                                            Button(action: {
                                                selectedView = 2
                                            }) {
                                                Label("Some other shit", systemImage: "lock.fill")
                                            }
                                        } label: {
                                            ZStack{
                                                VStack(alignment: .leading) {
                                                    Image("Guy")
                                                        .resizable()
                                                        .frame(width: 60, height: 70)
                                                        .scaledToFit()
                                                        .clipShape(Circle())
                                                    
                                                    VStack(alignment: .leading) {
                                                        Text("Bob Snow")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 12))
                                                        
                                                        Text("Tampa,FL")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 12))
                                                    }
                                                    Spacer(minLength: 0)
                                                }
                                                .padding(10)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                
                                                VStack(alignment: .trailing) {
                                                    
                                                    Text("This shit was cold of fuck I hate it f this place on my momma! I aint even lying either this shit sucks This shit was cold of fuck I hate it f this place on my momma! I aint even lying either this shit sucks")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 20))
                                                        .frame(width: proxy.size.width * 0.65)
                                                    
                                                    Spacer(minLength: 0)
                                                    
                                                    
                                                    
                                                    Text("Hold for More")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 12))
                                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                                }
                                                .padding(15)
                                            }
                                        }
                                    }
                                    .onChange(of: selectedView) {
                                        switch selectedView {
                                        case 0:
                                            true
                                        case 1:
                                            true
                                        case 2:
                                            true
                                        default:
                                            break
                                        }
                                    }
                                } else {
                                    VStack(alignment: .leading) {
                                        Text("\(reviewSample.body)...")
                                            .foregroundColor(.white)
                                        
                                        Text("Tap To Expand")
                                            .foregroundColor(.white)
                                            .font(.system(size: 12))
                                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                                    }
                                    .padding(15)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                
                            }
                            .onTapGesture {
                                if self.isExpanded {
                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        setSheetBoundary(lowestPoint: 300, highestPoint: 300)
                                        self.isExpanded.toggle()
                                    }
                                } else {
                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        setSheetBoundary(lowestPoint: 800, highestPoint: 800)
                                        self.isExpanded.toggle()
                                    }
                                }
                            }
                    }
                })
                .padding(15)
            }
            .scrollIndicators(.hidden)
            .scrollClipDisabled()
            .mask {
                Rectangle()
                    .padding(.bottom, -100)
            }
        }
        
    }
    
    private func setSheetBoundary(lowestPoint: Int, highestPoint: Int) {
        self.indentLow = lowestPoint
        self.indentHigh = highestPoint
    }
    
    private func positionNavBarHeight(geoReader: GeometryProxy) -> CGFloat {
        let result = self.indentLow == 90 ?
        geoReader.size.height * 0.02 : navbarIndex == 2 ?
        geoReader.size.height * 0.02 : geoReader.size.height * 0.05
        
        return result
    }
    
    private func adjustNavBarHeight(navBarIndex: Int) {
        switch navBarIndex {
        case 0:
            setSheetBoundary(lowestPoint: 90, highestPoint: 90)
        case 1:
            setSheetBoundary(lowestPoint: 300, highestPoint: 300)
        case 2:
            self.venues.removeAll()
            checkForLiveReviews()
            setSheetBoundary(lowestPoint: 300, highestPoint: 300)
        default:
            self.venues.removeAll()
            setSheetBoundary(lowestPoint: 800, highestPoint: 800)
        }
    }
    
    private func navBarIcon(geoReader: GeometryProxy, icon: CategoryModel) -> some View {
        VStack{
            Button(action: {
                if navbarIndex == icon.id {
                    navbarIndex = 0
                    filterLvlOneIndices.removeAll()
                    
                } else {
                    navbarIndex = icon.id
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
    
    private func navBarDetails(geoReader: GeometryProxy) -> some View {
        VStack{
            if navbarIndex != 0 {
                if navbarIndex == 1 {
                    displayFilter(geoReader: geoReader)
                }
                
                if navbarIndex == 2 {
                    Divider()
                    
                    VStack{
                        CustomTabBar()
                        
                        GeometryReader {
                            let size = $0.size
                            ScrollView(.horizontal) {
                                LazyHStack(spacing: 0) {
                                    SampleView(.purple)
                                        .id(TabModel.recent)
                                        .containerRelativeFrame(.horizontal)
                                    
                                    SampleView(.red)
                                        .id(TabModel.top)
                                        .containerRelativeFrame(.horizontal)
                                    
                                    SampleView(.blue)
                                        .id(TabModel.popular)
                                        .containerRelativeFrame(.horizontal)
                                }
                                .scrollTargetLayout()
                                .offsetX { value in
                                    /// Converting Offset into Progress
                                    let progress = -value / (size.width * CGFloat(TabModel.allCases.count - 1))
                                    
                                    /// Capping Progress BTW 0-1
                                    tabProgress = max(min(progress, 1), 0)
                                }
                            }
                            .scrollPosition(id: $selectedTab)
                            .scrollIndicators(.hidden)
                            .scrollTargetBehavior(.paging)
                            .scrollClipDisabled()
                        }
                        .frame(height: self.isExpanded ? geoReader.size.height * 0.78 : geoReader.size.height * 0.2)
                    }
                }
                
                if navbarIndex == 3 {
                    VStack{
                        Text("What should I eat today?")
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                        
                        RecommendationModal(showModal: $showModal, startSearch: $startSearch, searchText: $searchText, position: $position, showVenueFilter: $showVenueFilter, venue: $currentVenue)
                    }
                    .frame(height: geoReader.size.height * 0.8)
                }
            }
        }
    }
    
    private func reviewsOverlay(geoReader: GeometryProxy) -> some View {
        VStack{
            Button(action: {
                isOverlayDisplayed.toggle()
            }) {
                Image(systemName: "x.circle")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing)
            }
            
            Text("Was your food cold?")
                .font(.system(size: 40))
                .foregroundColor(.white)
            
            Text("Help out the community! Give your review on these recent visits: ")
                .font(.system(size: 20))
                .foregroundColor(.white)
                .padding(.leading)
                .padding(.trailing)
            
            ScrollView {
                VStack{
                    ForEach(0..<7) { _ in
                        Button(action: {
                            
                        }) {
                            HStack {
                                Image("greenLemon")
                                    .resizable()
                                    .frame(width: geoReader.size.width * 0.19, height: geoReader.size.height * 0.19)
                                    .scaledToFill()
                                    .clipShape(Circle())
                                
                                VStack {
                                    Text("Miguelotios")
                                        .font(.system(size: 32))
                                        .foregroundColor(.white)
                                    
                                    Text("3744 Acr rd Tampa Fl")
                                        .font(.system(size: 15))
                                        .foregroundColor(.white)
                                }
                                
                            }
                            .frame(width: geoReader.size.width * 0.9, height: geoReader.size.height * 0.2)
                            .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.white, lineWidth: 6)
                                    .frame(width: geoReader.size.width * 0.89, height: geoReader.size.height * 0.15)
                            }
                        }
                    }
                }
            }
            
            Spacer()
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
