//
//  LiveFeed.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 8/19/23.
//

import SwiftUI
import MapKit

struct City: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    var name: String
    var address: String
}



struct FeedHomeView: View {
    @State private var showHamburgerMenu: Bool = false
    @StateObject private var homeViewModel = HomeViewModel()
    @State private var searchText: String = ""
    @State private var feed: [FeedModel] = MockService.feedSampleData
    @State private var searchResults: [MKMapItem] = []
    @State private var startSearch: Bool = false
    
    
    //Animated View properties
    @State var currentIndex: Int = 0
    
    
    
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
    
    @State private var cities: [City] = [
//         City(coordinate: .init(latitude: 27.9506, longitude: -82.4572)),
//         City(coordinate: .init(latitude: 30.9506, longitude: -83.4572)),
//         City(coordinate: .init(latitude: 27.9506, longitude: -84.4572))
     ]
    
   // let geoReader: GeometryProxy

    
    var body: some View {
        GeometryReader { geoReader in
            ZStack{
                Color.white
                    .ignoresSafeArea()
                
               BGView()
                
                ZStack{
                    VStack{
                        SearchBar(searchText: $searchText, startSearch: $startSearch)
                            .padding(.bottom)

                        Map(coordinateRegion: $region, annotationItems: cities) { city in
//                            MapAnnotation(
//                                coordinate: city.coordinate,
//                                anchorPoint: CGPoint(x: 0.5, y: 0.5)
//                            ) {
//                                Circle()
//                                    .stroke(Color.red)
//                                    .frame(width: 44, height: 44)
//                            }
                            
                            MapMarker(coordinate: city.coordinate, tint: .red)
                                
                        }
                            .frame(width: geoReader.size.width * 0.98, height: geoReader.size.height * 0.5)
                            .cornerRadius(30)
                        
                        
                        ScrollView{
                            VStack{
                                ForEach(self.cities) { message in
                                        ZStack{
                                            Text("")
                                                .frame(width: 380, height: 110)
                                                .background(.gray)
                                                .cornerRadius(30)

                                            VStack{
                                                Text("\(message.name)")
                                                    .font(.system(size: 20))
                                                    .foregroundColor(.white)
                                                
                                                Text("\(message.address)")
                                                    .font(.system(size: 10))
                                                    .foregroundColor(.white)

//                                                Spacer()
//                                                    .frame(height: 50)
                                            }
                                        }
                                        .padding(.bottom, geoReader.size.height * 0.003)
                                    }
                            }
                        }
                    }
                        .position(x: geoReader.frame(in: .local).midX, y: geoReader.size.height * 0.64)
                        .onAppear{
                            homeViewModel.getUserProfile() {(userProfileId) -> Void in
                                if userProfileId != "" {
                                    //get profileImage
                                    homeViewModel.getImageStorageFile(profileId: userProfileId)
                                }
                            }
                        }
                        .onChange(of: startSearch) { value in
                            search(for: self.searchText)
                        }
                        .onChange(of: searchText) { value in
                            if self.searchText == "" {
                                self.cities.removeAll()
                            }
                        }
                    
                    
                    Text("CrunchFeed")
                        .bold()
                        .foregroundColor(.black)
                        .font(.largeTitle)
                       .position(x:geoReader.size.width * 0.25, y:geoReader.size.height * 0.1)
                    
                    Header(showHamburgerMenu: $showHamburgerMenu, isLoading: .constant(false), foodFilter: .constant(MockService.foodFilterSampleData), filteredCards: .constant([]), homeViewModel: homeViewModel)
                }
                .disabled(self.showHamburgerMenu ? true : false)
            }
            
            //Display HamburgerMenu
            if self.showHamburgerMenu {
                HamburgerMenu(showHamburgerMenu: self.$showHamburgerMenu, geoReader: geoReader)
                    .frame(width: geoReader.size.width/2)
                    .padding(.trailing, geoReader.size.width * 0.5)
            }
     }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
    
    // Blurred BG
    @ViewBuilder
    func BGView()->some View{
        GeometryReader{proxy in
            let size = proxy.size
            
            TabView(selection: $currentIndex) {
                ForEach(movies.indices, id: \.self){index in
                    Image(movies[index].artwork)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                        .clipped()
                        .tag(index)
                    
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.easeInOut, value: currentIndex)
            
            let color: Color = .white
            //Custom Gradient
            LinearGradient(colors: [
                .white,
                .clear,
                color

            ], startPoint: .top, endPoint: .bottom)
            
            // Blurred Overlay
            Rectangle()
                .fill(.ultraThinMaterial)
        }
        .ignoresSafeArea()
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
                let city = City(coordinate: result.placemark.coordinate, name: result.name ?? "", address: result.placemark.title ?? "")
                self.cities.append(city)
            }
        
            //print(searchResults)
        }
    }
}

struct FeedHomeView_Previews: PreviewProvider {
    static var previews: some View {
       // GeometryReader{ proxy in
        FeedHomeView()
      //  }

    }
}
