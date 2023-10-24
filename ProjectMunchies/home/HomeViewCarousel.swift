//
//  HomeViewCarousel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 9/2/23.
//

import SwiftUI
import UIKit
import FirebaseStorage
import MapKit

struct HomeViewCarousel: View {
    @StateObject private var homeViewModel = HomeViewModel()
    @StateObject private var cardViewModel = CardViewModel()
    @State private var detailProfile: ProfileModel?
    @State private var showDetailView: Bool = false
    @State private var detailImages: [UIImage] = [UIImage()]
    @State private var isLoading: Bool = false
    @State private var showHamburgerMenu: Bool = false
    @State private var cards: [ProfileModel] = []
    @State private var groups: [GroupModel] = []
    @State private var allGroups: [GroupModel] = [GroupModel(id: "", profileIds: [], groupProfile: MockDataService.userProfileSampleData)]
    @State private var inviteSent: Bool = false
    @State private var phase = 0.0
    @State private var offset: CGFloat = 0
    @State private var searchText: String = ""
    @State private var searchResults: [MKMapItem] = []
    @State private var startSearch: Bool = false
    @State private var showFindBunchPopover: Bool = false
    @State private var opacity: CGFloat = 0.2
    @State var appear = false
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
    
    //controls swiping cards left to right
    @State private var swipeIndex: Int = 0
    //toggles slidingTabs Connect/Discover
    @State private var slidingTabsIndex: Int = 0
    // FOR MATCHED GEOMETRY EFFECT STORING CURRENT CARD SIZE
    @State private var currentCardSize: CGSize = .zero
    //Animated View properties
    @State private var currentIndex: Int = 0
    
    // Environment Values
    @Namespace var animation
    @Environment (\.colorScheme) var scheme
    let storage = Storage.storage()
    
    var body: some View {
        NavigationStack{
            GeometryReader{geoReader in
                ZStack{
                    BGView()
                    
                    Header(showHamburgerMenu: $showHamburgerMenu, isLoading: $isLoading, foodFilter: $homeViewModel.foodFilter, filteredCards: $cards, homeViewModel: homeViewModel)
                    
                    SlidingTabs(slidingTabsIndex: $slidingTabsIndex, tabNames: ["Connect","Discover"], geoReader: geoReader)
                        .position(x: geoReader.frame(in: .local).midX, y: geoReader.size.height * 0.1)
                    
                    //mainView
                    mainDisplay(geoReader: geoReader)
                }
                .onAppear{
                    getProfileData()
                }
                //            .popover(isPresented: $showFindBunchPopover) {
                //                findBunchPopover()
                //            }
                .onChange(of: homeViewModel.foodFilter){ newValue in
                    //do this to have more profiles to choose from in db
                    //homeViewModel.lastDoc = nil
                    homeViewModel.getFilteredRecords(foodFilter: newValue, isReset: true){(foodFilters) in
                        if foodFilters.isEmpty{
                            print(homeViewModel.lastDoc.data())
                        }
                    }
                }
                .onChange(of: startSearch) { value in
                    searchB(for: self.searchText)
                }
                .onChange(of: searchText) { value in
                    if self.searchText == "" {
                        self.cities.removeAll()
                    }
                }
                
                //Display HamburgerMenu
                if self.showHamburgerMenu {
                    HamburgerMenu(showHamburgerMenu: self.$showHamburgerMenu, geoReader: geoReader)
                        .frame(width: geoReader.size.width/2)
                        .padding(.trailing, geoReader.size.width * 0.5)
                }
            }
        }
    }
    
    @ViewBuilder
    private func CustomIndicator()->some View{
        HStack(spacing: 5){
            ForEach(self.groups.indices, id: \.self){index in
                Circle()
                    .fill(swipeIndex == index ? .blue : .gray.opacity(0.5))
                    .frame(width: swipeIndex == index ? 10 : 6, height: swipeIndex == index ? 10 : 6)
            }
        }
        .animation(.easeInOut, value: swipeIndex)
    }
    
    // Blurred BG
    @ViewBuilder
    private func BGView()->some View{
        GeometryReader{proxy in
            let size = proxy.size
            
            TabView(selection: $swipeIndex) {
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
            .animation(.easeInOut, value: swipeIndex)
            
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
    
    private func mainDisplay(geoReader: GeometryProxy) -> some View {
        ZStack{
            if slidingTabsIndex == 0 {
                swipeDownIndicator(geoReader: geoReader)
            }
      
            
            if !isLoading{
                //slidingTabsIndex Connect = 0, Discover = 1
                displayCards(geoReader: geoReader)
                    .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.65)
                
            } else {
                ProgressView()
                    .controlSize(.large)
                    .position(x: geoReader.frame(in: .local).midX, y: geoReader.size.height * 0.35)
            }
            
            Footer()
                .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.85)
        }
        .overlay{
            if let profile = detailProfile,showDetailView{
                DetailView(profile: profile, showDetailVew: $showDetailView, currentCardSize: $currentCardSize, detailImages: $detailImages, animation: animation)
            }
        }
        
    }
    
    private func displayCards(geoReader: GeometryProxy) -> some View{
        ZStack{
            if slidingTabsIndex == 1 {
//                SnapCarousel(spacing: 20,trailingSpace: 110, swipeIndex: $swipeIndex, items: self.cards){profile in
//                    GeometryReader{proxy in
//                        let size = proxy.size
//                        ScrollView(.vertical, showsIndicators: false){
//                            CardViewCarousel(size: size, profile: profile, slidingTabsIndex: self.slidingTabsIndex,  detailProfile: $detailProfile, showDetailView: $showDetailView, currentCardSize: $currentCardSize, detailImage: $detailImage)
//                        }
//                        .position(x: geoReader.size.width * 0.4, y: geoReader.size.height * 0.75)
//                    }
//                }
//                // Since Carousel is Moved The current Card a little bit up
//                //Using padding to avoid the Undercovering the top element
//                .padding(.top,50)
//                .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.35)
                discoverGroups(geoReader: geoReader)
            } else {
                SnapCarousel(spacing: geoReader.size.width * 0.1, trailingSpace: geoReader.size.width * 0.2, swipeIndex: $swipeIndex, items: self.groups){group in
                    GeometryReader{proxy in
                        let size = proxy.size
                        ScrollView(.vertical, showsIndicators: false){
                            CardViewCarousel(size: size, profile: group.groupProfile, groupProfileIds: group.profileIds, slidingTabsIndex: self.slidingTabsIndex,  detailProfile: $detailProfile, showDetailView: $showDetailView, currentCardSize: $currentCardSize, detailImages: $detailImages)
                                .onChange(of: offset) { newValue in
                                    // your own custom threshold for toggling inviteDetails view
                                    if newValue > 260{
                                        withAnimation(.easeInOut){
                                            showFindBunchPopover = true
                                            
                                        }
                                        
                                        
                                        //                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05){
                                        //                                            withAnimation(.easeInOut){
                                        //                                                showFindBunchPopover = true
                                        //                                            }
                                        //                                        }
                                    }
                                    
                                }
                                .modifier(OffsetModifier(offset: $offset))
//                                .navigationDestination(isPresented: $showFindBunchPopover){
//                                    FindBunchView(showFindBunchPopover: $showFindBunchPopover)
//                                }
                        }
                        .position(x: geoReader.size.width * 0.4, y: geoReader.size.height * 0.65)
                    }
                }
                // Since Carousel is Moved The current Card a little bit up
                //Using padding to avoid the Undercovering the top element
                .padding(.top,50)
                .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.35)
            }
        }
    }
    
    private func Footer()->some View{
        VStack{
            if slidingTabsIndex == 0 {
                CustomIndicator()
            }
         
        }
    }
    
    private func swipeDownIndicator(geoReader: GeometryProxy) -> some View {
        VStack{
            Image(systemName: "arrow.down.circle.fill")
                .resizable()
                .foregroundColor(.blue)
                .frame(width: geoReader.size.width * 0.2, height: geoReader.size.height * 0.1)
            
            
            Text("Swipe down")
                .font(.title2)
                .opacity(0.5)
        }
        .opacity(opacity)
        .animation(
            .easeInOut(duration: 1).repeatForever(),
            value: opacity
        )
        .onAppear(perform: { opacity = 1 })
        
        .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.9)
    }
    
    private func getProfileData() {
        homeViewModel.getUserProfile() {(userProfileId) -> Void in
            if userProfileId != "" {
                //get profileImage
                homeViewModel.getImageStorageFile(profileId: userProfileId)
                getGroups(){(groupIds) in
                    if !groupIds.isEmpty{
                        print("success")
                    }
                    
                }
            } else {
                homeViewModel.createUserProfile() {(newUserProfileId) -> Void in
                    if newUserProfileId != "" {
                        getProfiles(filterProfileIds: []){(profiles) in
                            if !profiles.isEmpty {
                                filterCards(){(selfCards) in
                                    //should something be here?
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func filterCards(completed: @escaping(_ selfCards: [ProfileModel])-> Void) {
        // 18 <= age <= 70
        let ageFilteredCards: [ProfileModel] = self.cards.filter{Int($0.age) ?? 0 >= Int(homeViewModel.foodFilter.ageRangeFrom) ?? 0 &&  Int($0.age) ?? 0 <= Int(homeViewModel.foodFilter.ageRangeTo) ?? 0}
        
        if homeViewModel.foodFilter.gender.lowercased() == "male" {
            self.cards = ageFilteredCards.filter({$0.gender.lowercased() == "male"})
            completed(self.cards)
        }
        else if homeViewModel.foodFilter.gender.lowercased() == "female" {
            self.cards = ageFilteredCards.filter({$0.gender.lowercased() == "female"})
            completed(self.cards)
        }
        else if homeViewModel.foodFilter.gender.lowercased() == "pick" {
            self.cards = ageFilteredCards
            completed(self.cards)
        }
    }
    
    public func getProfiles(filterProfileIds: [String], completed: @escaping (_ profiles: [ProfileModel]) -> Void) {
        //Clean if dirty
        self.cards.removeAll()
        
        if filterProfileIds.isEmpty {
            db.collection("profiles")
                .whereField("id", isNotEqualTo: homeViewModel.userProfile.id)
                .limit(to: 10)
                .getDocuments() {(querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                        completed([])
                    }else {
                        for document in querySnapshot!.documents {
                            let data = document.data()
                            if !data.isEmpty{
                                let profile = ProfileModel(id: data["id"] as? String ?? "", fullName: data["fullName"] as? String ?? "", location: data["location"] as? String ?? "", description: data["description"] as? String ?? "", gender: data["gender"] as? String ?? "", age: data["age"] as? String ?? "", fcmTokens: data["fcmTokens"] as? [String] ?? [], messageThreadIds: data["messageThreadIds"] as? [String] ?? [],occupation: data["occupation"] as? String ?? "", favRestaurant: data["favRestaurant"] as? String ?? "" , favFood: data["favFood"] as? String ?? "", hobbies: data["hobbies"] as? [String] ?? [], eventIds: data["eventIds"] as? [String] ?? [], isMockData: data["isMockData"] as? Bool ?? false, bunchIds: data["bunchIds"] as? [String] ?? [])
                                self.cards.append(profile)
                            }
                        }
                        completed(self.cards)
                    }
                }
        }else {
            var profiles: [ProfileModel] = []
            var profileIds: [String] = []
            var batches: [Any] = []
            profileIds = filterProfileIds
            
            while(!profileIds.isEmpty){
                let batch = Array(profileIds.prefix(10))
                let count = profileIds.count
                if count < 10{
                    profileIds.removeSubrange(ClosedRange(uncheckedBounds: (lower: 0, upper: count - 1)))
                }else {
                    profileIds.removeSubrange(ClosedRange(uncheckedBounds: (lower: 0, upper: 9)))
                }
                
                batches.append(
                    db.collection("profiles")
                        .whereField("id", in: batch)
                        .limit(to: 10)
                        .getDocuments() {(querySnapshot, err) in
                            if let err = err {
                                print("Error getting documents: \(err)")
                                completed([])
                            }else {
                                for document in querySnapshot!.documents {
                                    let data = document.data()
                                    if !data.isEmpty{
                                        let profile = ProfileModel(id: data["id"] as? String ?? "", fullName: data["fullName"] as? String ?? "", location: data["location"] as? String ?? "", description: data["description"] as? String ?? "", gender: data["gender"] as? String ?? "", age: data["age"] as? String ?? "", fcmTokens: data["fcmTokens"] as? [String] ?? [], messageThreadIds: data["messageThreadIds"] as? [String] ?? [],occupation: data["occupation"] as? String ?? "", favRestaurant: data["favRestaurant"] as? String ?? "" , favFood: data["favFood"] as? String ?? "", hobbies: data["hobbies"] as? [String] ?? [], eventIds: data["eventIds"] as? [String] ?? [], isMockData: data["isMockData"] as? Bool ?? false, bunchIds: data["bunchIds"] as? [String] ?? [])
                                        profiles.append(profile)
                                    }
                                }
                                
                                profiles.shuffle()
                                completed(profiles)
                            }
                        }
                )
            }
        }
    }
    
    public func getGroups(completed: @escaping (_ groupIds: [GroupModel]) -> Void) {
        //clean if dirty
        self.groups.removeAll()
        
        db.collection("groups")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                    completed([])
                } else {
                    for document in querySnapshot!.documents {
                        //                        print("\(document.documentID) => \(document.data())")
                        let data = document.data()
                        if !data.isEmpty{
                            let group = GroupModel(id: data["id"] as? String ?? "", profileIds: data["profileIds"] as? [String] ?? [],
                                                   groupProfile:  ProfileModel(id: data["id"] as? String ?? "", fullName: data["fullName"] as? String ?? "", location: data["location"] as? String ?? "", description: data["description"] as? String ?? "", gender: data["gender"] as? String ?? "", age: data["age"] as? String ?? "", fcmTokens: data["fcmTokens"] as? [String] ?? [], messageThreadIds: data["messageThreadIds"] as? [String] ?? [],occupation: data["occupation"] as? String ?? "", favRestaurant: data["favRestaurant"] as? String ?? "" , favFood: data["favFood"] as? String ?? "", hobbies: data["hobbies"] as? [String] ?? [], eventIds: data["eventIds"] as? [String] ?? [], isMockData: data["isMockData"] as? Bool ?? false, bunchIds: data["bunchIds"] as? [String] ?? []))
                            
                            self.groups.append(group)
                        }
                    }
                    completed(self.groups)
                }
            }
    }
    
    private func findBunchPopover() -> some View {
        GeometryReader{ geoReader in
            ZStack{
                Color.white
                    .scaleEffect(1.5)
                
                Map(coordinateRegion: $region, annotationItems: cities) { city in
                    MapMarker(coordinate: city.coordinate, tint: .red)
                }
                .frame(width: geoReader.size.width, height: geoReader.size.height * 1.4)
                
                popoverBody(geoReader: geoReader)
                    .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.7)
                
                popoverButtons(geoReader: geoReader)
                    .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.95)
                
                popoverHeader(geoReader: geoReader)
            }
        }
    }
    
    public func searchB(for query: String) {
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
        }
    }
    
    private func popoverHeader(geoReader: GeometryProxy) -> some View {
        ZStack{
            Text("Invite Details")
                .bold()
                .foregroundColor(.black)
                .font(.largeTitle)
                .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.04)
            
            SearchBar(searchText: $searchText, startSearch: $startSearch, textFieldName: "Search...")
                .padding(.bottom)
                .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.12)
        }
    }
    
    private func popoverButtons(geoReader: GeometryProxy) -> some View {
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
                showFindBunchPopover.toggle()
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
    }
    
    private func popoverBody(geoReader: GeometryProxy) -> some View {
        ZStack{
            Text("")
                .frame(width: geoReader.size.width * 0.9, height: geoReader.size.height * 0.3)
                .background(.white)
                .cornerRadius(30)
            
            ScrollView{
                VStack{
                    ForEach(self.cities) { message in
                        VStack{
                            Text("\(message.name)")
                                .font(.system(size: 25))
                                .foregroundColor(.black)
                            
                            Text("\(message.address)")
                                .font(.system(size: 10))
                                .foregroundColor(.black)
                                .padding(.bottom,15)
                            
                            Divider()
                        }
                        
                        .padding(.bottom, geoReader.size.height * 0.003)
                    }
                }
            }
            .frame(width: geoReader.size.width * 0.5, height: geoReader.size.height * 0.3)
        }
    }
    
    private func discoverGroups(geoReader: GeometryProxy) -> some View {
        VStack{
                SearchBar(searchText: $searchText, startSearch: .constant(false), textFieldName: "Search groups...")
                
                ScrollView{
                    VStack{
                        ForEach(self.allGroups) { group in
                            NavigationLink(destination: SignInView()) {
                                ZStack{
                                    Text("")
                                        .frame(width: 380, height: 200)
                                        .background(.gray)
                                        .cornerRadius(30)
                                    VStack{
                                        Text("Group Name")
                                            .font(.title2)
                                            .foregroundColor(.white)
                                   
                                            HStack{
                                                ForEach(0..<3){ item in
                                                    ZStack{
                                                        Image("Guy")
                                                                    .resizable()
                                                                    .scaledToFill()
                                                                    .frame(width: 50, height: 50)
                                                                    .cornerRadius(20)
                                                                    .foregroundColor(.white)
                                                                 
                                                    }
                                                }
                                              

                                                Image(systemName: "plus.circle.fill")
                                                            .resizable()
                                                            .scaledToFill()
                                                            .frame(width: 50, height: 50)
                                                            .cornerRadius(20)
                                                            .foregroundColor(.white)
                                            }
                                    }
                                   
                                    
                                }
                            }
                        }
                    }
                }
        }
    }
}

struct HomeViewCarousel_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewCarousel()
    }
}

