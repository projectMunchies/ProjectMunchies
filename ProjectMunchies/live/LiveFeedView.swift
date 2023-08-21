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
}



struct LiveFeedView: View {
    @State private var showHamburgerMenu: Bool = false
    @StateObject private var homeViewModel = HomeViewModel()
    @State private var searchText: String = ""
    @State private var feed: [FeedModel] = MockService.feedSampleData
    @State private var searchResults: [MKMapItem] = []
    
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

    
    var body: some View {
        GeometryReader { geoReader in
            ZStack{
                Color.white
                    .ignoresSafeArea()
                
                ZStack{
                    VStack{
                        SearchBar(searchText: $searchText)

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
                        
                        
                        Button(action: {
                            search(for: "beaches")
                        }) {
                            Text("Search")
                                .frame(width: 380, height: 60)
                                .background(Color.gray)
                                .cornerRadius(40)
                                .foregroundColor(.white)
                        }
//                        ScrollView{
//                            VStack{
//                                ForEach(self.feed.filter({searchText.isEmpty ? true: $0.text.contains(searchText)})) { message in
//                                        ZStack{
//                                            Text("")
//                                                .frame(width: 380, height: 100)
//                                                .background(.gray)
//                                                .cornerRadius(30)
//
//                                            VStack{
//                                                HStack{
//                                                    Spacer()
//                                                    Text("\(message.text)")
//                                                        .font(.system(size: 30))
//                                                        .foregroundColor(.white)
//
//                                                    Spacer()
//
////                                                    Image(systemName: "ellipsis")
////                                                        .resizable()
////                                                        .scaledToFill()
////                                                        .frame(width: 10, height: 5)
////                                                        .font(.system(size: 35))
////                                                        .foregroundColor(.white)
//                                                   // Spacer()
//                                                }
//
//                                                Spacer()
//                                                    .frame(height: 50)
//
//                                            }
//                                        }
//                                        .padding(.bottom, geoReader.size.height * 0.005)
//                                    }
//                            }
//                        }
                    }
                        .position(x: geoReader.frame(in: .local).midX, y: geoReader.size.height * 0.65)
                        .onAppear{
                            homeViewModel.getUserProfile() {(userProfileId) -> Void in
                                if userProfileId != "" {
                                    //get profileImage
                                    homeViewModel.getImageStorageFile(profileId: userProfileId)
                                }
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
    }
    
    private func search(for query: String) {
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
                let city = City(coordinate: result.placemark.coordinate)
                self.cities.append(city)
            }
        
            print(searchResults)
        }
    }
}

struct LiveFeedView_Previews: PreviewProvider {
    static var previews: some View {
        LiveFeedView()
    }
}
