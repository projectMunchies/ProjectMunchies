//
//  FindBunchView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 10/3/23.
//

import SwiftUI
import MapKit

struct City: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    var name: String
    var address: String
}
struct FindBunchView: View {
    @Binding var showFindBunchView: Bool
    @State private var showHamburgerMenu: Bool = false
    @StateObject private var homeViewModel = HomeViewModel()
    @State private var searchText: String = ""
    @State private var searchResults: [MKMapItem] = []
    @State private var startSearch: Bool = false
    @State var showModal: Bool = false
    @State var currentCity: City = City(coordinate: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0), name: "", address: "")
    
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
    var body: some View {
        NavigationStack{
            GeometryReader { geoReader in
                ZStack{
                    Color.white
                        .ignoresSafeArea()
                    
                    BGView()
                    
                    ZStack{
                        Text("Invite Details")
                            .bold()
                            .foregroundColor(.black)
                            .font(.title)
                            .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.01)
                        
                        
                        Map(coordinateRegion: $region, annotationItems: cities) { city in
                            MapAnnotation(coordinate: city.coordinate) {
                                Image(systemName: "mappin.and.ellipse")
                                //.stroke(.red, lineWidth: 3)
                                    .resizable()
                                    .frame(width: 45, height: 45)
                                    .foregroundColor(.red)
                                    .onTapGesture {
                                        currentCity = city
                                    }
                            }
                            
                        }
                        .frame(width: geoReader.size.width * 0.98, height: geoReader.size.height * 0.75)
                        .cornerRadius(30)
                        .position(x: geoReader.frame(in: .local).midX, y: geoReader.size.height * 0.42)
                        
                        SearchBar(searchText: $searchText, startSearch: $startSearch, textFieldName: "Search...", geoReader: geoReader)
                            .padding(.bottom)
                            .position(x: geoReader.frame(in: .local).midX, y: geoReader.size.height * 0.75)
                        
                        Button(action:  {
                            showModal.toggle()
                        }){
                            VStack{
                                Text("\(currentCity.name)")
                                    .bold()
                                    .foregroundColor(.black)
                                    .font(.title2)
                                
                                Text("\(currentCity.address)")
                                    .foregroundColor(.black)
                            }
                        }
                        // .padding(.bottom, geoReader.size.height * 0.003)
                        .frame(width: geoReader.size.width * 0.8, height: geoReader.size.height * 0.1)
                        .position(x: geoReader.frame(in: .local).midX, y: geoReader.size.height * 0.85)
                        
                        HStack{
                            Button{
                                
                            }label: {
                                Text("Send Invite")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding(.vertical)
                                    .frame(width:geoReader.size.width * 0.45, height:geoReader.size.height * 0.08)
                                    .background{
                                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                                            .fill(.green)
                                            .cornerRadius(40)
                                    }
                            }
                            
                            Button{
                                showFindBunchView.toggle()
                            }label: {
                                Text("Cancel")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding(.vertical)
                                    .frame(width:geoReader.size.width * 0.45, height:geoReader.size.height * 0.08)
                                    .background{
                                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                                            .fill(.red)
                                            .cornerRadius(40)
                                    }
                            }
                        }
                        .position(x: geoReader.frame(in: .local).midX, y: geoReader.size.height * 0.95)
                        
                        
                        if showModal {
                            Rectangle() // the semi-transparent overlay
                                .foregroundColor(Color.black.opacity(0.5))
                                .edgesIgnoringSafeArea(.all)
                            
                            GeometryReader { geometry in // the modal container
                                RoundedRectangle(cornerRadius: 16)
                                    .foregroundColor(.white)
                                    .frame(width: geoReader.size.width * 0.7, height: geoReader.size.height * 0.3)
                                    .overlay(ModalContentView(showModal: self.$showModal, geoReader: geoReader))
                            }
                            .transition(.move(edge: .bottom))
                            .position(x: geoReader.size.width * 0.65, y: geoReader.size.height * 0.75)
                            
                        }
                        
                        //                    Header(showHamburgerMenu: $showHamburgerMenu, isLoading: .constant(false), foodFilter: .constant(MockDataService.foodFilterSampleData), filteredCards: .constant([]), homeViewModel: homeViewModel)
                    }
                    .navigationBarBackButtonHidden(true)
                    .disabled(self.showHamburgerMenu ? true : false)
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
        
    }
    
    // Blurred BG
    @ViewBuilder
    func BGView()->some View{
        GeometryReader{proxy in
            let size = proxy.size
            
            TabView(selection: $currentIndex) {
                ForEach(mockProfiles.indices, id: \.self){index in
                    Image(mockProfiles[index].artwork)
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

struct FindBunchView_Previews: PreviewProvider {
    static var previews: some View {
        // GeometryReader{ proxy in
        FindBunchView(showFindBunchView: .constant(false))
        //  }
        
    }
}

struct ModalContentView: View {
    @Binding var showModal: Bool
    let geoReader: GeometryProxy
    @State private var eventDate: Date = Date()
    
    var body: some View {
        VStack {
            
            Text("Pick a Date")
                .bold()
                .font(.title3)
                .foregroundColor(.black)
                .position(x:geoReader.size.width * 0.35, y:geoReader.size.height * 0.05)
            
            DatePicker("",selection: $eventDate)
                .position(x:geoReader.size.width * 0.25, y:geoReader.size.height * 0.01)
            
            
            HStack{
                Button(action: {
                    withAnimation {
                        self.showModal.toggle()
                    }
                }) {
                    Text("Done")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width:geoReader.size.width * 0.2, height:geoReader.size.height * 0.04)
                        .background{
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.green)
                                .cornerRadius(40)
                        }
                }
                
                Button(action: {
                    withAnimation {
                        self.showModal.toggle()
                    }
                }) {
                    Text("Close")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width:geoReader.size.width * 0.2, height:geoReader.size.height * 0.04)
                        .background{
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.red)
                                .cornerRadius(40)
                        }
                }
            }
            .position(x:geoReader.size.width * 0.35, y:geoReader.size.height * 0.05)
            
        }
    }
}
