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
    
    @State private var showAddImagePopover: Bool = false
    @State var showModal: Bool = false
    @State private var searchText: String = ""
    @State private var searchResults: [MKMapItem] = []
    @State private var startSearch: Bool = false
    @State private var input1: String = ""
    @State private var isLoading: Bool = false
    @State private var showHamburgerMenu: Bool = false
    @State private var showImageSheet: Bool = false
    @State private var editInfo: Bool = false
    // for some reason I cant use homeViewModel.profileImage here
    @State private var profileImage: UIImage = UIImage()
    @State var isLargeImageAlert: Bool = false
    @State private var filteredCards: [ProfileModel] = []
    @State var currentCity: City = City(coordinate: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0), name: "", address: "")
    
    //Animated View properties
    @State var currentIndex: Int = 0
    
    @State var filterIndex: Int = 0
    @State private var foodFilterType = "Pick"
    @State private var foodFilterCategory = "Cuisine"
    
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
    
    let cuisineTypes = ["Chinese","American","Mexican","Japanese","Indian","Italian","Thai","French"]
    let drinkTypes = ["Juice","Smoothies","Soda","Tea","Coffee","Hot Chocolate"]
    let happHourTypes = ["Liquor","Beer","Wine","Margaritas","Cocktails"]
    let gender = ["Male","Female"]
    let mainCategories = ["Cuisine","Drinks","Happy Hour"]
    let locations = ["Tampa, Fl","Clearwater, Fl", "St.Petersburg, Fl"]
    
    var body: some View {
        GeometryReader{ geoReader in
            
            ZStack{
                Color.white
                    .ignoresSafeArea()
                ScrollViewReader{ value in
                ZStack{
                    Map(coordinateRegion: $region, annotationItems: cities) { city in
                        MapAnnotation(coordinate: city.coordinate) {
                            Image(systemName: "mappin.circle.fill")
                                .resizable()
                                .frame(width: geoReader.size.width * 0.05, height: geoReader.size.width * 0.05)
                                .foregroundColor(.red)
                                .onTapGesture {
                                    currentCity = city
                                    value.scrollTo(currentCity.id, anchor: .center)
                                }
                        }
                    }
                    .preferredColorScheme(.dark)
                    .cornerRadius(30)
                    .frame(width: geoReader.size.width * 1.0, height: geoReader.size.height * 1.3)
                    .position(x: geoReader.frame(in: .local).midX, y: geoReader.size.height * 0.5)
                    
//                    ZStack{
//                        Text("")
//                            .frame(width: geoReader.size.width * 0.92, height:  geoReader.size.height * 0.066)
//                            .background(.gray)
//                            .cornerRadius(15)
//                            .multilineTextAlignment(.center)
//                        //                            .position(x: geoReader.frame(in: .local).midX, y: geoReader.size.height * 0.04)
//                        //
//
//                        SearchBar(searchText: $searchText, startSearch: $startSearch, textFieldName: "Search nearby", geoReader: geoReader)
//
//                        // .padding(.bottom)
//                        //                                .position(x: geoReader.frame(in: .local).midX, y: geoReader.size.height * 0.04)
//                    }
//                    .position(x: geoReader.size.width * 0.47, y: geoReader.size.height * 0.04)
                    
                    
                    
                    Button(action: {
                        self.editInfo.toggle()
                    }) {
                        ZStack{
                            Text("")
                                .frame(width: 80, height: 80)
                                .background(.purple)
                                .cornerRadius(40)
                            
                            Image("filterIcon")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                    }
                    .disabled(self.startSearch ? true : false)
                    .sheet(isPresented: $editInfo) {
                        VStack{
                            Text("Filters")
                                .font(.title)
                            
                            HStack{
                                Button(action: {
                                    self.filterIndex = 1
                                }){
                                    Text("Food")
                                        .frame(width: 70, height: 40)
                                        .background(self.filterIndex == 1 ? .green : .gray)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                                
                                
                                Button(action: {
                                    self.filterIndex = 2
                                }){
                                    Text("Drinks")
                                        .frame(width: 70, height: 40)
                                        .background(self.filterIndex == 2 ? .green : .gray)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                                
                                
                                Button(action: {
                                    self.filterIndex = 3
                                }){
                                    Text("HappyHour")
                                        .frame(width: 70, height: 40)
                                        .background(self.filterIndex == 3 ? .green : .gray)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                                
                            }
                            .padding(.bottom)
                            
                            HStack{
                                Text("Type")
                                    .foregroundColor(.white)
                                    .font(.system(size: geoReader.size.height * 0.03))
                                
                                Spacer()
                                    .frame(width: geoReader.size.width * 0.4)
                                
                                Menu{
                                    Picker("", selection: $foodFilterType) {
                                        ForEach(changeFoodType(), id: \.self) {
                                            Text($0)
                                        }
                                    }
                                    .pickerStyle(.automatic)
                                } label: {
                                    Text("\(self.foodFilterType)")
                                        .font(.system(size: geoReader.size.height * 0.04))
                                        .frame(width: geoReader.size.width * 0.2)
                                        .foregroundColor(.gray)
                                }
                            }
                            HStack{
                                Text("Gender")
                                    .foregroundColor(.white)
                                    .font(.system(size: geoReader.size.height * 0.03))
                                
                                Spacer()
                                    .frame(width: geoReader.size.width * 0.4)
                                
                                Menu{
                                    Picker("", selection: $foodFilterType) {
                                        ForEach(changeFoodType(), id: \.self) {
                                            Text($0)
                                        }
                                    }
                                    .pickerStyle(.automatic)
                                } label: {
                                    Text("\(self.foodFilterType)")
                                        .font(.system(size: geoReader.size.height * 0.04))
                                        .frame(width: geoReader.size.width * 0.2)
                                        .foregroundColor(.gray)
                                }
                            }
                            HStack{
                                Text("Location")
                                    .foregroundColor(.white)
                                    .font(.system(size: geoReader.size.height * 0.03))
                                
                                Spacer()
                                    .frame(width: geoReader.size.width * 0.4)
                                
                                Menu{
                                    Picker("", selection: $foodFilterType) {
                                        ForEach(changeFoodType(), id: \.self) {
                                            Text($0)
                                        }
                                    }
                                    .pickerStyle(.automatic)
                                } label: {
                                    Text("\(self.foodFilterType)")
                                        .font(.system(size: geoReader.size.height * 0.04))
                                        .frame(width: geoReader.size.width * 0.2)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        .presentationDetents([.height(geoReader.size.height * 0.3),.medium,.large])
                        .presentationBackgroundInteraction(
                            .enabled(upThrough: .medium)
                        )
                    }
                    .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.98)
                    
                    subHeaderSection(for: geoReader)
                        .position(x:geoReader.size.width * 0.51, y:geoReader.size.height * 0.06)
                    
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(cities) { city in
                                
                                ZStack{
                                    Text("")
                                        .frame(width: geoReader.size.width * 0.7, height: geoReader.size.height * 0.25)
                                        .foregroundColor(.white)
                                        .background(Color("MainColor"))
                                        .cornerRadius(30)
                                        .overlay(
                                            VStack{
                                                Text(city.name)
                                                    .font(.title)
                                                    .bold()
                                                Text(city.address)
                                                    .font(.title2)
                                            }
                                        )
                                }
                            }
                        }
                    }
                    .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.8)
                    
//                    if showModal {
//                        Rectangle() // the semi-transparent overlay
//                            .foregroundColor(Color.black.opacity(0.5))
//                            .edgesIgnoringSafeArea(.all)
//
//                        GeometryReader { geometry in // the modal container
//                            RoundedRectangle(cornerRadius: 16)
//                                .foregroundColor(.white)
//                                .frame(width: geoReader.size.width * 0.7, height: geoReader.size.height * 0.3)
//                                .overlay(ModalContentView(showModal: self.$showModal, geoReader: geoReader))
//                        }
//                        .transition(.move(edge: .bottom))
//                        .position(x: geoReader.size.width * 0.65, y: geoReader.size.height * 0.5)
//
//                    }
                    
                    //                    Header(showHamburgerMenu: $showHamburgerMenu, isLoading: $isLoading, foodFilter: $homeViewModel.foodFilter, filteredCards: $filteredCards, homeViewModel: homeViewModel)
                }
                .disabled(self.showHamburgerMenu ? true : false)
                .onAppear{
                    homeViewModel.getUserProfile() {(userProfileId) -> Void in
                        if userProfileId != "" {
                            //get profileImage
                            homeViewModel.getImageStorageFile(profileId: userProfileId)
                        } else {
                            homeViewModel.createUserProfile() {(newUserProfileId) -> Void in
                                if newUserProfileId != "" {
                                    showAddImagePopover.toggle()
                                }
                            }
                        }
                    }
                }
                .onChange(of: startSearch) { value in
                    //self.showModal.toggle()
                    search(for: self.searchText)
                    // self.editInfo.toggle()
                }
                .onChange(of: searchText) { value in
                    if self.searchText == "" {
                        self.cities.removeAll()
                    }
                }
                .popover(isPresented: $showAddImagePopover) {
                    addImagePopover(for: geoReader)
                        .interactiveDismissDisabled()
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
    
    private func subHeaderSection(for geoReader: GeometryProxy) -> some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack(spacing: 15){
                ForEach(0..<5){_ in
                    ZStack{
    //                    Text("")
    //                        .frame(width: 400, height: 60)
    //                        .background(.black)
    //                        .cornerRadius(30)
                        HStack{
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .background(Color.black.opacity(0.2))
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                            
                            VStack{
                                Text("Happy Hour Man these nuggets is cool a f")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15))
                                
                                Text("by Anonymous user")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15))
                            }
                        }
                      
                       
                    }
                }
         
                
              
            
            }
        }
        .frame(height: 100)
        .mask(
            VStack(spacing: 0) {
                   // Left gradient
                   LinearGradient(gradient:
                      Gradient(
                        colors: [Color.black.opacity(0.2), Color.black, Color.black, Color.black]),
                                  startPoint: .top, endPoint: .bottom
                      )
                      .frame(width: 400, height: 80)

                   // Middle
                  // Rectangle().fill(Color.black)
//
                   // Right gradient
//                   LinearGradient(gradient:
//                      Gradient(
//                          colors: [Color.black, Color.black.opacity(0)]),
//                          startPoint: .top, endPoint: .bottom
//                      )
//                      .frame(width: 400)
               }

        )
    }
    
    private func addImagePopover(for geoReader: GeometryProxy) -> some View {
        ZStack{
            Color.white
            
            VStack{
                Group{
                    Text("Add profile image")
                        .foregroundColor(Color("MainColor"))
                        .font(.custom("Chalkduster", size: geoReader.size.height * 0.035))
                        .multilineTextAlignment(.center)
                    
                    imageSection(for: geoReader)
                    Spacer()
                        .frame(height: geoReader.size.height * 0.04)
                }
                
                Button(action: {
                    //if Save Image button is displayed = save image, close popover
                    if editInfo == true {
                        homeViewModel.uploadStorageFile(image: self.profileImage, profileId: homeViewModel.userProfile.id) {(message) -> Void in
                            if message == "image too large" {
                                isLargeImageAlert.toggle()
                            } else if message == "success" {
                                showAddImagePopover.toggle()
                            }
                        }
                    }
                    editInfo.toggle()
                }) {
                    Text(editInfo ? "Save Image" : "Add Image")
                        .font(.system(size: 25))
                        .frame(width: 380, height: 70)
                        .background(Color.green)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                }
                .padding(.top)
                .alert("Image too large, choose another image", isPresented: $isLargeImageAlert) {
                            Button("OK", role: .cancel) { }
                        }
            }
        }
//        .sheet(isPresented: $showImageSheet){
//            // Pick an image from the photo library:
//            ImagePicker(sourceType: .photoLibrary, selectedImage: $profileImage)
//
//            //  If you wish to take a photo from camera instead:
//            // ImagePicker(sourceType: .camera, selectedImage: self.$image)
//        }
    }
    
    private func imageSection(for geoReader: GeometryProxy) -> some View {
        VStack{
            Image(uiImage: profileImage)
                .resizable()
                .frame(width: 150, height: 150)
                .background(Color.black.opacity(0.2))
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
            
            if(editInfo) {
                Button(action: {
                    showImageSheet = true
                }) {
                    Text("Upload Image")
                        .font(.headline)
                        .frame(width: geoReader.size.width * 0.4, height: geoReader.size.height * 0.04)
                        .background(Color.blue)
                        .cornerRadius(geoReader.size.height * 0.04)
                        .shadow(radius: 10, x: 10, y: 10)
                        .foregroundColor(Color.white)
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
                let city = City(coordinate: result.placemark.coordinate, name: result.name ?? "", address: result.placemark.title ?? "")
                self.cities.append(city)
            }
            
            //print(searchResults)
        }
    }
    
    private func changeFoodType() -> [String] {
        var types: [String] = []
        switch self.foodFilterCategory{
        case "Cuisine" :
            types = cuisineTypes;
        case "Drinks" :
            types = drinkTypes;
        case "Happy Hour" :
            types = happHourTypes
        default:
            types = []
        }
        return types;
    }
}

struct City: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    var name: String
    var address: String
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
