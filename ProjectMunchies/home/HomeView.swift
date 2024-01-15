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
    
    @Binding var searchText: String
    @Binding var startSearch: Bool
    @Binding var position: MapCameraPosition
    
    @State private var searchResults: [MKMapItem] = []
    @State var foodButtonPressed: Bool = false
    @State var drinkButtonPressed: Bool = false
    @State var nightButtonPressed: Bool = false
    @State var isDropdownOpen: Bool = false
    @State var sideButtonIndex = 0
    @State private var showModal: Bool = false
    @State private var currentSpot: Int = 0
    @State private var categoryIndex: Int = 0
    @State private var categoryTypeIndex: Int = 0
    @State private var showFilter: Bool = true
    @State private var showVenueFilter: Bool = false
    @State private var venue: VenueModel = venueSample
    @State private var showSpotlight: Bool = false
    @State private var indent: Int = 80
    @State var sideButtonIndexOptions: [Int] = [1,2,3]
    @State var searchTextFoodOptions: [String] = ["mexican food","american food","indian food", "japanese food","italian food"]
    @State var searchTextDrinkOptions: [String] = ["Juice","Smoothie","Soda", "Coffee"]
    @State var searchTextNightSpotsOptions: [String] = ["","",""]
    @State var liveFeedComments: [String] = ["Happy Hour Man these nuggets is cool a f", "Ehh not really fan of these fries", "These waffles are only good on the weekend", "No Im not liking Chipotle right now"]
    @State private var venues: [VenueModel] = []
    @State private var route: MKRoute?
    @State private var travelTime: String?
    @State var currentVenue: VenueModel = VenueModel(coordinate: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0), name: "", address: "")
    @State var nightSpots: [CLLocationCoordinate2D] = [CLLocationCoordinate2D(
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
    
    var body: some View {
        GeometryReader{ geoReader in
            ZStack{
                Color.white
                    .ignoresSafeArea()
                ScrollViewReader{ scrollReader in
                    ZStack{
                        displayMap(for: geoReader, scrollReader: scrollReader)
                            .position(x: geoReader.frame(in: .local).midX, y: geoReader.size.height * 0.5)
                        
                        subHeaderSection(for: geoReader)
                            .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.03)
                        
                        displayVenues(for: geoReader)
                            .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.7)
                        
                        
                    }
                    .onAppear{
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
                    .onChange(of: startSearch) {
                        if self.startSearch == true {
                            self.venues.removeAll()
                            search(for: self.searchText)
                        }
                    }
                    .onChange(of: searchText) {
                        if self.searchText == "" {
                            self.venues.removeAll()
                        }
                    }
                }
            }
            .sheet(isPresented: $showFilter) {
                displayFilterSheet(geoReader: geoReader)
                    .presentationDetents([.height(CGFloat(indent))])
                    .presentationDragIndicator(.visible)
                    .presentationBackgroundInteraction(
                        .enabled(upThrough: .height(CGFloat(indent))))
                    .interactiveDismissDisabled()
            }
            .onChange(of:currentSpot) {
                if currentSpot == 4 {
                    withAnimation{
                        showModal.toggle()
                    }
                }
            }
            .onAppear {
                //showSpotlight = true
            }
            .onChange(of: venue.address) {
                showVenueFilter.toggle()
            }
            .sheet(isPresented: $showVenueFilter) {
                VStack{
                    Text("\(venue.name)")
                        .foregroundColor(.white)
                        .font(.title)
                    
                    Text("\(venue.address)")
                        .foregroundColor(.white)
                }
                .presentationDetents([.height(100)])
                .presentationDragIndicator(.visible)
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .addSpotlightOverlay(show: $showSpotlight, currentSpot: $currentSpot)
    }
    
    private func subHeaderSection(for geoReader: GeometryProxy) -> some View {
        VStack(alignment: .leading){
            HStack {
                Button(action: {
                    withAnimation {
                        isDropdownOpen.toggle()
                    }
                }) {
                    HStack {
                        Text("Live Reviews ")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold))
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.black)
                            .frame(height: 35)
                    )
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.green)
                            .frame(height: 35)
                    )
                    .addSpotlight(3, shape: .rounded, roundedRadius: 20, text: "See what the community is saying \nabout venues in your area. \nJoin the fun by adding your own reviews! \ntap screen to complete tutorial")
                    .opacity(0.7)
                    
                    Image(systemName: isDropdownOpen ? "chevron.up" : "chevron.down")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 12, height: 12)
                        .foregroundColor(.white)
                }
                .padding()
                .zIndex(1)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .overlay(
                VStack(spacing: 15) {
                    if isDropdownOpen {
                        ScrollView {
                            LazyVStack(spacing: 18) {
                                ForEach(self.liveFeedComments, id: \.self) { comment in
                                    HStack(alignment: .top) {
                                        Image(systemName: "person.circle")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .background(Color.black.opacity(0.2))
                                            .aspectRatio(contentMode: .fill)
                                            .clipShape(Circle())
                                            .padding(.trailing, 25)
                                        
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text(comment)
                                                .foregroundColor(.white)
                                                .font(.system(size: 16))
                                            
                                            Text("by Anonymous user")
                                                .foregroundColor(.purple)
                                                .font(.system(size: 15))
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                        .frame(width: geoReader.size.width * 0.75,                            height: min(geoReader.size.height * 0.60, CGFloat(self.liveFeedComments.count) * 57.0))
                        .padding()
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(15)
                        .offset(x: -8, y: geoReader.size.height * 0.215)
                    }
                }
            )
            .frame(maxHeight: .infinity)
        }
        .padding(.leading)
    }
    
    private func displayMap(for geoReader: GeometryProxy, scrollReader: ScrollViewProxy ) -> some View {
        Map(position: $position) {
            if self.sideButtonIndex == 3 {
                if let route {
                    MapPolyline(route.polyline)
                    //.stroke(.blue, lineWidth: 8)
                        .stroke(gradient, style: stroke)
                }
            } else {
                ForEach(venues) { venue in
                    Annotation("", coordinate: venue.coordinate) {
                        Image(systemName: "mappin.circle.fill")
                            .resizable()
                            .frame(width: geoReader.size.width * 0.05, height: geoReader.size.width * 0.05)
                            .foregroundColor(.red)
                            .onTapGesture {
                                currentVenue = venue
                                scrollReader.scrollTo(currentVenue.id, anchor: .center)
                            }
                    }
                }
            }
        }
        .onMapCameraChange { mapCameraUpdateContext in
            self.region = mapCameraUpdateContext.region
        }
        .onAppear(perform: {
            fetchRouteFrom(nightSpots[self.sideButtonIndexOptions.randomElement()!], to: nightSpots[self.sideButtonIndexOptions.randomElement()!])
        })
        .preferredColorScheme(.dark)
        .cornerRadius(30)
        .frame(width: geoReader.size.width * 1.0, height: geoReader.size.height * 1.5)
    }
    
    private func buttonsOnSide(for geoReader: GeometryProxy) -> some View {
        VStack{
            VStack{
                Button(action: {
                    self.venues.removeAll()
                    
                    if self.sideButtonIndex == 1 {
                        withAnimation{
                            self.showModal.toggle()
                        }
                        self.sideButtonIndex = 0
                        self.searchText = ""
                    }else {
                        withAnimation{
                            self.showModal.toggle()
                        }
                        self.sideButtonIndex = 1
                    }
                }){
                    ZStack{
                        Text("")
                            .frame(width: 55, height: 55)
                            .background(self.sideButtonIndex == 1 && showModal ? .green : .gray)
                            .cornerRadius(10)
                        VStack{
                            Image(systemName: "fork.knife.circle.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.white)
                            
                            Text("Cusines")
                                .font(.system(size: 10))
                                .foregroundColor(.white)
                        }
                    }
                }
                
                Button(action: {
                    self.venues.removeAll()
                    withAnimation {
                        self.showModal.toggle()
                    }
                    if self.sideButtonIndex == 2 {
                        self.sideButtonIndex = 0
                        self.searchText = ""
                    }else {
                        self.sideButtonIndex = 2
                    }
                }){
                    ZStack{
                        Text("")
                            .frame(width: 55, height: 55)
                            .background(self.sideButtonIndex == 2 && showModal ? .green : .gray)
                            .cornerRadius(10)
                        VStack{
                            Image(systemName: "wineglass.fill")
                                .resizable()
                                .frame(width: 20, height: 25)
                                .foregroundColor(.white)
                            
                            Text("Drinks")
                                .font(.system(size: 10))
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            .addSpotlight(1, shape: .rounded, roundedRadius: 5, text: "What should I eat and drink today? These buttons are powered by AI and got you covered  \ntap screen to continue")
            
            VStack{
                Button(action: {
                    self.venues.removeAll()
                    
                    if self.sideButtonIndex == 3 {
                        self.sideButtonIndex = 0
                        self.searchText = ""
                    }else {
                        self.sideButtonIndex = 3
                        self.searchText = ""
                        self.startSearch = true
                        fetchRouteFrom(nightSpots.randomElement()!, to: nightSpots.randomElement()!)
                    }
                }){
                    ZStack{
                        Text("")
                            .frame(width: 55, height: 55)
                            .background(self.sideButtonIndex == 3 ? .green : .gray)
                            .cornerRadius(10)
                        
                        VStack{
                            Image(systemName: "figure.socialdance")
                                .resizable()
                                .frame(width: 25, height: 20)
                                .foregroundColor(.white)
                            
                            Text("What's \nHot")
                                .font(.system(size: 10))
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            .addSpotlight(2, shape: .rectangle, roundedRadius: 0, text: "Whats the hot spot for today? This button can answer that \ntap screen to continue")
        }
        .opacity(0.6)
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
    
    public func search(for query: String) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.resultTypes = .pointOfInterest
        request.region = self.region
        Task {
            let search = MKLocalSearch(request: request)
            let response = try? await search.start()
            searchResults = response?.mapItems ?? []
            
            for result in searchResults {
                let venue = VenueModel(coordinate: result.placemark.coordinate, name: result.name ?? "", address: result.placemark.title ?? "")
                self.venues.append(venue)
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
            VStack{
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
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
                        Spacer()
                            .frame(width: 30)
                    }
                }
            }
            .padding(.top, self.indent == 80 ?
                     50 : categoryIndex == 2 ?
                     20 : 100)
            .onChange(of: categoryIndex) {
                if categoryIndex == 0 {
                    self.indent = 80
                } else if categoryIndex == 2 {
                    self.indent = 600
                } else {
                    self.indent = 300
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
                            
                            RecommendationModal(showModal: $showModal, startSearch: $startSearch, searchText: $searchText, position: $position, showVenueFilter: $showVenueFilter, venue: $venue)
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
                                //                                self.searchText = i.name + " " + self.searchText
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
                showFilter.toggle()
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
        ))
                                                                                                                           ))
    }
}
