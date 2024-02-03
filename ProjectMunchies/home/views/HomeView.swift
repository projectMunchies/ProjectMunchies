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
    @State private var sideButtonIndex = 0
    @State private var showModal: Bool = false
    @State private var categoryIndex: Int = 0
    @State private var categoryTypeIndex: Int = 0
    @State private var showVenueFilter: Bool = false
    @State private var currentVenue: VenueModel = emptyVenue
    @State private var venues: [VenueModel] = []
    @State private var route: MKRoute?
    @State private var travelTime: String?
    @State private var indentLow: Int = 80
    @State private var indentHigh: Int = 80
    @State private var showBottomTabs: Bool = false
    @State private var newSpecials: [SpecialModel] = []
    @State private var isSettingsPresented: Bool = false
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
                                                   .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.03)
                        
                        //                        displayVenues(for: geoReader)
                        //                            .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.7)
                    }
                    .onAppear{
                        self.showBottomTabs.toggle()
                        getUserProfile()
                        checkForNewMapAlerts()
                    }
                    .onChange(of: startSearch) {
                        if self.startSearch {
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
               Spacer()
               
               // Profile icon button
               Button(action: {
                   isSettingsPresented.toggle()
               }) {
                   Image(systemName: "person.circle")
                       .resizable()
                       .frame(width: 30, height: 30)
                       .foregroundColor(.white)
                       .padding()
                        // Add a red border for debugging
               }
               .sheet(isPresented: $isSettingsPresented) {
                   SettingsView()
               }
               .padding(.trailing, 16)
           }
           .padding(.horizontal, 16)
           .padding(.top, 16)
       }
         
     
    
    private func displayMap(for geoReader: GeometryProxy, scrollReader: ScrollViewProxy ) -> some View {
        Map(position: $position) {
            ForEach(self.venues) { venue in
                Annotation("", coordinate: venue.coordinates) {
                    ZStack{
                        displayMapAlerts(geoReader: geoReader, venue: venue)
                    }
                    .onTapGesture {
                        self.showBottomTabs.toggle()
                        self.indentLow = 200
                        self.indentHigh = 800
                        currentVenue = venue
                        scrollReader.scrollTo(currentVenue.id, anchor: .center)
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
                HStack{
                    Spacer()
                        .frame(width: geoReader.size.width * 0.1)
                    
                    if self.showBottomTabs {
                        ForEach(homeCategories) { i in
                            Button(action: {
                                if categoryIndex == i.id {
                                    categoryIndex = 0
                                } else {
                                    categoryIndex = i.id
                                    self.searchText = i.name
                                }
                            }){
                                VStack{
                                    ZStack{
                                        Circle()
                                            .foregroundColor(self.categoryIndex == i.id ? .green : .gray)
                                            .frame(width: 70, height: 70)
                                        
                                        Image(i.icon)
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                            .font(.system(size: 35))
                                            .foregroundColor(.black)
                                    }
                                    Text(i.name)
                                        .foregroundColor(.white)
                                }
                                .padding(.leading)
                            }
                        }
                    }
                    
                    if !self.showBottomTabs {
                        detailsView(geoReader: geoReader, venue: currentVenue, specials: newSpecials)
                    }
                }
            }
            .padding(.top, self.indentLow == 80 ?
                     50 : categoryIndex == 2 ?
                     20 : 100)
            .onChange(of: categoryIndex) {
                if categoryIndex == 0 {
                    self.indentLow = 80
                } else if categoryIndex == 2 {
                    self.indentLow = 600
                } else {
                    self.indentLow = 300
                }
            }
            if categoryIndex != 0 {
                if categoryIndex == 1 {
                    displayFilter(geoReader: geoReader)
                }
                
                if categoryIndex == 2 {
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
            VStack{
                HStack{
                    Text("Type")
                        .font(.system(size: 20))
                        .padding(.leading,geoReader.size.width * 0.02)
                    Spacer()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(switchCategoryTypes()) { i in
                            Button(action: {
                                categoryTypeIndex = i.id
                                self.searchText = i.name
                            }){
                                VStack{
                                    ZStack{
                                        Circle()
                                            .foregroundColor(self.categoryTypeIndex == i.id ? .green : .gray)
                                            .frame(width: 90, height: 90)
                                        
                                        if categoryIndex != 0 {
                                            Image(i.icon)
                                                .resizable()
                                                .frame(width: 40, height: 40)
                                                .font(.system(size: 35))
                                                .foregroundColor(.black)
                                        }
                                    }
                                    
                                    if categoryIndex != 0 {
                                        Text(i.name)
                                    }
                                }
                                .padding(.leading)
                            }
                        }
                    }
                }
            }
            .opacity(categoryIndex != 0 ? 1 : 0.3)
            .disabled(categoryIndex != 0 ? false : true)
            
            Button(action: {
                startSearch.toggle()
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
    }
    
    private func switchCategoryTypes() -> [CategoryTypeModel]{
        switch categoryIndex {
        case 1:
            return cuisineTypes
        case 2:
            return drinkTypes
        case 3:
            return happHourTypes
        default:
            return [CategoryTypeModel(id: 1, name: "", icon: "")]
        }
    }
    
    private func detailsView(geoReader: GeometryProxy, venue: VenueModel, specials: [SpecialModel]) -> some View {
        VStack{
            HStack{
                VStack{
                    Text("New Specials")
                        .font(.system(size: 50))
                        .foregroundColor(.yellow)
                    
                    Text("Rome + Fig")
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
                    self.showBottomTabs.toggle()
                    self.indentLow = 80
                    currentVenue = VenueModel(id: "0", name: "", coordinates: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0), address: "", reviews: [], specials: [])
                }){
                    Image(systemName: "x.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.gray)
                }
            }
        }
    }
    
    private func displayMapAlerts(geoReader: GeometryProxy, venue: VenueModel) -> some View {
        ZStack{
            if !venue.specials.isEmpty && !venue.reviews.isEmpty {
                VStack{
                    Text("New!")
                        .bold()
                        .font(.system(size: 15))
                        .foregroundColor(.yellow)
                    
                    PacmanAnimation()
                }
            } else if !venue.specials.isEmpty  {
                VStack{
                    Text("New \nSpecial")
                        .bold()
                        .font(.system(size: 15))
                        .foregroundColor(.orange)
                    SpinningView()
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
                    .frame(width: geoReader.size.width * 0.12, height: geoReader.size.width * 0.12)
                }
            }
        }
        .onAppear{
      
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
