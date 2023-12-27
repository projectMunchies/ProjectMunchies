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
    
    @State private var searchResults: [MKMapItem] = []
    @State var foodButtonPressed: Bool = false
    @State var drinkButtonPressed: Bool = false
    @State var nightButtonPressed: Bool = false
    //@State var historyButtonPressed: Bool = false
    @State var sideButtonIndex = 0
    @State var sideButtonIndexOptions: [Int] = [1,2,3]
    @State var searchTextFoodOptions: [String] = ["mexican food","american food","indian food", "japanese food","italian food"]
    @State var searchTextDrinkOptions: [String] = ["Juice","Smoothie","Soda", "Coffee"]
    @State var searchTextNightSpotsOptions: [String] = ["","",""]
    @State var liveFeedComments: [String] = ["Happy Hour Man these nuggets is cool a f", "Ehh not really fan of these fries", "These waffles are only good on the weekend", "No Im not liking Chipotle right now"]
    @State private var venues: [VenueModel] = []
    @State private var route: MKRoute?
    @State private var travelTime: String?
    @State private var isDropdownOpen = false
    @State private var dropdownToggle: Bool = false
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
            latitudeDelta: 0.1,
            longitudeDelta: 0.1
        )
    )
    
    @State private var position: MapCameraPosition = .region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 27.9506,
            longitude: -82.4572
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.1,
            longitudeDelta: 0.1
        )
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
                        
                        buttonsOnSide(for: geoReader)
                            .position(x:geoReader.size.width * 0.9, y:geoReader.size.height * 0.5)
                        
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
                        self.sideButtonIndex = self.sideButtonIndexOptions.randomElement()!
                        self.searchText = changeButtonData()
                        self.startSearch = true
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
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
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
                                Text("Live Reviews")
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
                                    .fill(Color.black)
                                    .frame(height: 35)
                                
                            )
                            
                            Image(systemName: isDropdownOpen ? "chevron.up" : "chevron.down")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 12, height: 12)
                                .foregroundColor(.white)
                            // .padding()
                            // .background(
                            //   RoundedRectangle(cornerRadius: 15)
                            //     .fill(Color.black)
                            //   .frame(height: 35)                                                    )
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
                                .frame(width: geoReader.size.width * 0.75,                            height: min(geoReader.size.height * 0.60, CGFloat(self.liveFeedComments.count) * 57.0)) // Adjust the height as needed
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.black.opacity(0.8))
                                )
                                .padding()
                                .background(Color.black.opacity(0.8))
                                .cornerRadius(15)
                                .offset(x: -8, y: geoReader.size.height * 0.215) // Adjust the offset as needed
                                .zIndex(0)
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
        .onAppear(perform: {
            fetchRouteFrom(nightSpots[self.sideButtonIndexOptions.randomElement()!], to: nightSpots[self.sideButtonIndexOptions.randomElement()!])
        })
        .preferredColorScheme(.dark)
        .cornerRadius(30)
        .frame(width: geoReader.size.width * 1.0, height: geoReader.size.height * 1.5)
    }
    
    private func buttonsOnSide(for geoReader: GeometryProxy) -> some View {
        VStack{
            Button(action: {
                self.venues.removeAll()
                
                if self.sideButtonIndex == 1 {
                    self.sideButtonIndex = 0
                    self.searchText = ""
                }else {
                    self.sideButtonIndex = 1
                    self.searchText = self.searchTextFoodOptions.randomElement()!
                    self.startSearch = true
                }
            }){
                ZStack{
                    Text("")
                        .frame(width: 50, height: 50)
                        .background(self.sideButtonIndex == 1 ? .green : .gray)
                        .cornerRadius(10)
                    
                    Image(systemName: "fork.knife.circle.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                }
            }
            
            Button(action: {
                self.venues.removeAll()
                
                if self.sideButtonIndex == 2 {
                    self.sideButtonIndex = 0
                    self.searchText = ""
                }else {
                    self.sideButtonIndex = 2
                    self.searchText = self.searchTextDrinkOptions.randomElement()!
                    self.startSearch = true
                }
            }){
                ZStack{
                    Text("")
                        .frame(width: 50, height: 50)
                        .background(self.sideButtonIndex == 2 ? .green : .gray)
                        .cornerRadius(10)
                    
                    Image(systemName: "wineglass.fill")
                        .resizable()
                        .frame(width: 15, height: 20)
                        .foregroundColor(.white)
                }
            }
            
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
                        .frame(width: 50, height: 50)
                        .background(self.sideButtonIndex == 3 ? .green : .gray)
                        .cornerRadius(10)
                    
                    Image(systemName: "figure.socialdance")
                        .resizable()
                        .frame(width: 25, height: 20)
                        .foregroundColor(.white)
                }
            }
            
//            Button(action: {
//                self.venues.removeAll()
//                
//                if self.sideButtonIndex == 4 {
//                    self.sideButtonIndex = 0
//                    self.searchText = ""
//                }else {
//                    self.sideButtonIndex = 4
//                    self.searchText = ""
//                    self.startSearch = true
//                }
//            }){
//                ZStack{
//                    Text("")
//                        .frame(width: 50, height: 50)
//                        .background(self.sideButtonIndex == 4 ? .green : .gray)
//                        .cornerRadius(10)
//                    
//                    Image(systemName: "clock.fill")
//                        .resizable()
//                        .frame(width: 20, height: 20)
//                        .foregroundColor(.white)
//                }
           // }
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
        request.region = MKCoordinateRegion(
            center: region.center, span: MKCoordinateSpan(latitudeDelta: 0.0125, longitudeDelta: 0.0125)
        )
        
        Task {
            let search = MKLocalSearch(request: request)
            let response = try? await search.start()
            searchResults = response?.mapItems ?? []
            
            for result in searchResults {
                let venue = VenueModel(coordinate: result.placemark.coordinate, name: result.name ?? "", address: result.placemark.title ?? "")
                self.venues.append(venue)
            }
            print(searchResults)
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
    
    private func changeButtonData() -> String {
        var types: String = ""
        switch self.sideButtonIndex{
        case 1 :
            types = self.searchTextFoodOptions.randomElement()!;
        case 2 :
            types = self.searchTextDrinkOptions.randomElement()!;
        case 3 :
            types = self.searchTextNightSpotsOptions.randomElement()!
        default:
            types = ""
        }
        return types;
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(searchText: .constant(""), startSearch: .constant(false))
    }
}
