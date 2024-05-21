//
//  HomeView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/27/23.
//

import SwiftUI
import MapKit
import FirebaseFirestore

struct HomeView: View {
    @StateObject private var homeViewModel = HomeViewModel()
    @StateObject private var reviewsViewModel = ReviewsViewModel()
    @StateObject private var specialsViewModel = SpecialsViewModel()
    
    @Binding var searchText: String
    @Binding var startSearch: Bool
    @Binding var position: MapCameraPosition
    
    @State private var scale: CGFloat = 0.5
    @State private var delay: Double = 0
    
    @State private var selectedOccasion = 0
    @State private var searchResults: [VenueModel] = []
    @State private var showSuccessMessage = false
    @State private var selectedVenue: VenueModel?
    @State private var showModal: Bool = false
    @State private var navbarIndex: Int = 0
    @State private var filterLvlOneIndices: [Int] = []
    @State private var filterLvlTwoIndices: [Int] = []
    @State private var showVenueFilter: Bool = false
    @State private var currentVenue: VenueModel = emptyVenue
    @State private var venues: [VenueModel] = []
    @State private var route: MKRoute?
    @State private var selectedWho = 0
    @State private var restaurantName = ""
    @State private var selectedDate = Date()
    @State private var selectedTime = Date()
    @State private var reason = ""
    @State private var description = ""
    @State private var rating = 0
    
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
    
    @State private var isSearching = false
    @State private var selectedTimeOfDay = 0
    @State private var selectedTab: TabModel?
    @State private var tabProgress: CGFloat = 0.5
    @State private var selectedView: Int?
    @State private var newReviewTitle: String = ""
    @State private var newReviewBody: String = ""
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
    
    public func searchForVenues(query: String, mapAlertVenue: VenueModel = emptyVenue) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.resultTypes = .pointOfInterest
        request.region = self.region
        
        Task {
            let search = MKLocalSearch(request: request)
            let response = try? await search.start()
            
            // Map MKMapItem objects to VenueModel objects
            searchResults = response?.mapItems.map { mapItem -> VenueModel in
                VenueModel(
                    id: UUID().uuidString,
                    name: mapItem.name ?? "",
                    coordinates: mapItem.placemark.coordinate,
                    address: mapItem.placemark.title ?? "",
                    reviews: [],
                    specials: []
                )
            } ?? []
            
            for venue in searchResults {
                // If mapAlertVenue is empty
                if mapAlertVenue.id == "" {
                    self.venues.append(venue)
                } else {
                    // Update the coordinates of the existing mapAlertVenue
                    var updatedMapAlertVenue = mapAlertVenue
                    updatedMapAlertVenue.coordinates = venue.coordinates
                    
                    // Remove the existing mapAlertVenue from venues array
                    self.venues.removeAll(where: { $0.id == mapAlertVenue.id })
                    
                    // Append the updated mapAlertVenue to venues array
                    self.venues.append(updatedMapAlertVenue)
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
                    currentVenue = emptyVenue
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
    
    private func checkForLiveReviews() {
        reviewsViewModel.getAllNewReviews { newReviews in
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
                .background(selectedTab == tab ? Color.black : Color.clear)
                .foregroundColor(selectedTab == tab ? .white : .black)
                .onTapGesture {
                    withAnimation(.snappy) {
                        selectedTab = tab
                    }
                }
            }
        }
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        .padding(.horizontal, 15)
    }
    private func SampleView(_ color: Color) -> some View {
        GeometryReader { proxy in
            ScrollView(.vertical) {
                LazyVGrid(columns: Array(repeating: GridItem(), count: 1), content: {
                    ForEach(selectedTab == .recent ? reviewsViewModel.newReviews : reviewsViewModel.popularReviews, id: \.id) { review in
                        ReviewCell(review: review)
                            .environmentObject(reviewsViewModel)
                    }
                })
                .padding(15)
            }
            .scrollIndicators(.hidden)
            .scrollDisabled(true)
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
            selectedTab = .recent
            let fixedHeight = Int(UIScreen.main.bounds.height * 0.65)
            setSheetBoundary(lowestPoint: fixedHeight, highestPoint: fixedHeight)
        default:
            self.venues.removeAll()
            let fixedHeight = Int(UIScreen.main.bounds.height * 0.65)
            setSheetBoundary(lowestPoint: fixedHeight, highestPoint: fixedHeight)
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
        VStack {
            if navbarIndex != 0 {
                if navbarIndex == 1 {
                    displayFilter(geoReader: geoReader)
                }
                
                if navbarIndex == 2 {
                           Divider()
                           
                           let customTabBar = CustomTabBar()
                           
                           let scrollView = ScrollView(.horizontal) {
                               LazyHStack(spacing: 0) {
                                   if selectedTab == .recent {
                                       Color.clear
                                           .id(TabModel.recent)
                                           .containerRelativeFrame(.horizontal)
                                           .overlay(
                                               ScrollView {
                                                   LazyVStack {
                                                       ForEach(reviewsViewModel.newReviews.sorted(by: { $0.timeStamp > $1.timeStamp }), id: \.id) { review in
                                                           ReviewCell(review: review)
                                                               .environmentObject(reviewsViewModel)
                                                       }
                                                   }
                                               }
                                           )
                                   } else if selectedTab == .popular {
                                       Color.clear
                                           .id(TabModel.popular)
                                           .containerRelativeFrame(.horizontal)
                                           .overlay(
                                               ScrollView {
                                                   LazyVStack {
                                                       ForEach(reviewsViewModel.popularReviews.sorted(by: { $0.timeStamp > $1.timeStamp }), id: \.id) { review in
                                                           ReviewCell(review: review)
                                                               .environmentObject(reviewsViewModel)
                                                       }
                                                   }
                                               }
                                           )
                                   } else {
                                       newReviewForm(geoReader: geoReader)
                                           .frame(width: geoReader.size.width, height: geoReader.size.height)
                                   }
                               }
                               .scrollTargetLayout()
                               .offsetX { value in
                                   let progress = -value / (geoReader.size.width * CGFloat(TabModel.allCases.count - 2))
                                   tabProgress = max(min(progress, 1), 0)
                               }
                           }
                           .scrollPosition(id: $selectedTab)
                           .scrollIndicators(.hidden)
                           .scrollTargetBehavior(.paging)
                           .scrollDisabled(true)
                    
                    VStack {
                        customTabBar
                        
                        GeometryReader { proxy in
                            let size = proxy.size
                            scrollView
                        }
                        .frame(height: geoReader.size.height * 0.6)
                    }
                    .onChange(of: selectedTab) { newTab in
                        if newTab == .new {
                            let fixedHeight = Int(UIScreen.main.bounds.height * 0.75)
                            setSheetBoundary(lowestPoint: fixedHeight, highestPoint: fixedHeight)
                        } else {
                            let fixedHeight = Int(UIScreen.main.bounds.height * 0.751)
                            setSheetBoundary(lowestPoint: fixedHeight, highestPoint: fixedHeight)
                        }
                    }
                }
                
                if navbarIndex == 3 {
                    VStack {
                        Text("What should I eat today?")
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                        
                        RecommendationModal(showModal: $showModal, startSearch: $startSearch, searchText: $searchText, position: $position, showVenueFilter: $showVenueFilter, venue: $currentVenue)
                    }
                    .frame(height: geoReader.size.height * 0.45)
                }
            }
        }
    }
    private func newReviewForm(geoReader: GeometryProxy) -> some View {
        VStack {
            Text("Crumb Trails")
                .font(.title)
                .foregroundColor(.white)
                .padding()
            
            ScrollView {
                VStack(spacing: 20) {
                    // Party
                    VStack {
                        Text("Party")
                            .font(.headline)
                        
                        Picker("Select an option", selection: $selectedWho) {
                            ForEach(0..<8) { index in
                                Text("\(index)").tag(index)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                    
                    Divider()
                        .background(Color.white)
                        .padding(.vertical)
                    
                    // Location
                    VStack {
                        Text("Location")
                            .font(.headline)
                        
                        TextField("Enter restaurant name", text: $searchText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .onChange(of: searchText) { newValue in
                                searchVenues(searchText: newValue)
                            }
                        
                        if isSearching {
                            ProgressView()
                        }
                        
                        if !searchResults.isEmpty {
                            List(searchResults, id: \.id) { venue in
                                VStack(alignment: .leading) {
                                    Text(venue.name)
                                        .font(.headline)
                                    Text(venue.address)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                .onTapGesture {
                                    selectedVenue = venue
                                    searchText = venue.name
                                    searchResults = []
                                }
                            }
                            .listStyle(PlainListStyle())
                            .frame(height: 110)
                        }
                        
                        if let venue = selectedVenue {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(venue.name)
                                        .font(.headline)
                                    Text(venue.address)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                
                                Button(action: {
                                    selectedVenue = nil
                                    searchText = ""
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.red)
                                }
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        }
                    }
                    
                    Divider()
                        .background(Color.white)
                        .padding(.vertical)
                    
                    // Time of Day
                    VStack {
                        Text("Time of Day")
                            .font(.headline)
                        
                        Picker("Select time of day", selection: $selectedTimeOfDay) {
                            Text("Breakfast").tag(0)
                            Text("Lunch").tag(1)
                            Text("Happy Hour").tag(2)
                            Text("Dinner").tag(3)
                            Text("After Hours").tag(4)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Divider()
                        .background(Color.white)
                        .padding(.vertical)
                    
                    // Occasion
                    VStack {
                        Text("Occasion")
                            .font(.headline)
                        
                        Picker("Select an occasion", selection: $selectedOccasion) {
                            Text("Birthday").tag(0)
                            Text("Anniversary").tag(1)
                            Text("Accomplishment").tag(2)
                            Text("Date").tag(3)
                            Text("Other").tag(4)
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                    
                    Divider()
                        .background(Color.white)
                        .padding(.vertical)
                    
                    // Order
                    VStack {
                        Text("Order")
                            .font(.headline)
                        
                        VStack {
                            ForEach(0..<5) { index in
                                TextField("Enter item \(index + 1)", text: $orderItems[index])
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding(.vertical, 4)
                            }
                        }
                        .padding(.vertical)
                    }
                    
                    Divider()
                        .background(Color.white)
                        .padding(.vertical)
                    
                    // Rating
                    VStack {
                        Text("Rating")
                            .font(.headline)
                        
                        HStack {
                            ForEach(0..<5) { index in
                                Image(systemName: "star.fill")
                                    .foregroundColor(index < rating ? .yellow : .gray)
                                    .onTapGesture {
                                        rating = index + 1
                                    }
                            }
                        }
                    }
                }
                .padding()
            }
            .frame(height: geoReader.size.height * 0.3)
            
            Button(action: {
                addNewReview()
            }) {
                Text("Submit Review")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            
            if showSuccessMessage {
                VStack {
                    Image(systemName: "checkmark")
                        .font(.largeTitle)
                        .foregroundColor(.green)
                    
                    Text("Congrats! You submitted a review.")
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color.black)
                .cornerRadius(10)
                .transition(.opacity)
            }
        }
        .background(Color.gray.opacity(0.8))
        .cornerRadius(20)
        .frame(width: geoReader.size.width * 0.92, height: geoReader.size.height * 0.18)
    }
    
    @State private var orderItems = Array(repeating: "", count: 5)
    
    
    
    func searchVenues(searchText: String) {
        isSearching = true
        reviewsViewModel.searchVenues(searchText: searchText) { venues in
            searchResults = venues.filter { venue in
                let nameMatches = venue.name.lowercased().contains(searchText.lowercased())
                let addressMatches = venue.address.lowercased().contains(searchText.lowercased())
                return nameMatches || addressMatches
            }
            isSearching = false
        }
    }
    
    func addNewReview() {
        let timeOfDay: String
        switch selectedTimeOfDay {
        case 0:
            timeOfDay = "Breakfast"
        case 1:
            timeOfDay = "Lunch"
        case 2:
            timeOfDay = "Happy Hour"
        case 3:
            timeOfDay = "Dinner"
        case 4:
            timeOfDay = "After Hours"
        default:
            timeOfDay = "Unknown"
        }
        
        let reviewBody = """
                Party: \(selectedWho)
                Time of Day: \(timeOfDay)
                Occasion: \(reason)
                Order: \(description)
                """
        
        // Use the user's profile ID instead of "user_profileId"
        let newReview = ReviewModel(
            id: UUID().uuidString,
            title: selectedVenue?.name ?? "",
            body: reviewBody,
            profileId: homeViewModel.userProfile.id, // Use the user's profile ID from the HomeViewModel
            venueId: selectedVenue?.id ?? "",
            timeStamp: Date(),
            thumbsUp: 0,
            isLiked: false,
            rating: rating
        )
        
        reviewsViewModel.addNewReview(newReview: newReview, venueName: selectedVenue?.name ?? "") { success in
            if success {
                // Insert the new review at the beginning of the array
                withAnimation {
                    reviewsViewModel.newReviews.insert(newReview, at: 0)
                }
                selectedWho = 0
                selectedTimeOfDay = 0
                reason = ""
                description = ""
                selectedVenue = nil
                searchText = ""
                rating = 0
                
                showSuccessMessage = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    showSuccessMessage = false
                }
                
                // Refresh the live reviews
                checkForLiveReviews()
                
            }
        }
    }
    struct ReviewCell: View {
        let review: ReviewModel
        
        @EnvironmentObject private var reviewsViewModel: ReviewsViewModel
        
        var body: some View {
              VStack(alignment: .leading, spacing: 0) {
                  HStack {
                      Text(review.profileId)
                          .font(.headline)
                          .foregroundColor(.blue)
                      
                      Spacer()
                      
                      Text(Date().timeAgoDisplay(from: review.timeStamp))
                          .font(.subheadline)
                          .foregroundColor(.gray)
                  }
                  .padding(.bottom, 4)
                  
                  Text(review.title)
                      .font(.headline)
                      .padding(.bottom, 2)
                  
                  Text(review.body)
                      .font(.subheadline)
                      .padding(.bottom, 4)
                  
                  HStack {
                      ForEach(0..<5) { index in
                          Image(systemName: "star.fill")
                              .foregroundColor(index < review.rating ? .yellow : .gray)
                      }
                      
                      Spacer()
                      
                      Button(action: {
                          toggleLiked()
                      }) {
                          HStack {
                              Image(systemName: review.isLiked ? "hand.thumbsup.fill" : "hand.thumbsup")
                                  .foregroundColor(.blue)
                              
                              Text("\(review.thumbsUp)")
                                  .foregroundColor(.blue)
                          }
                      }
                  }
              }
              .padding()
              .background(Color.black)
              .cornerRadius(10)
          }
        
        private func toggleLiked() {
            if let index = reviewsViewModel.newReviews.firstIndex(where: { $0.id == review.id }) {
                reviewsViewModel.newReviews[index].isLiked.toggle()
                if reviewsViewModel.newReviews[index].isLiked {
                    reviewsViewModel.newReviews[index].thumbsUp += 1
                    reviewsViewModel.addToLikedReviews(review: reviewsViewModel.newReviews[index])
                } else {
                    reviewsViewModel.newReviews[index].thumbsUp -= 1
                    reviewsViewModel.removeFromLikedReviews(reviewId: reviewsViewModel.newReviews[index].id)
                }
                
                // Update the Firestore document
                let db = Firestore.firestore()
                let reviewRef = db.collection("reviews").document(review.id)
                reviewRef.updateData([
                    "thumbsUp": reviewsViewModel.newReviews[index].thumbsUp,
                    "isLiked": reviewsViewModel.newReviews[index].isLiked
                ]) { error in
                    if let error = error {
                        print("Error updating thumbs up count: \(error)")
                    } else {
                        print("Thumbs up count updated successfully")
                    }
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

