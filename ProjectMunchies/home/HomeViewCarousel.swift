//
//  HomeViewCarousel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 9/2/23.
//

import SwiftUI
import UIKit
import FirebaseStorage

struct HomeViewCarousel: View {
    @StateObject private var homeViewModel = HomeViewModel()
    @StateObject private var cardViewModel = CardViewModel()
    //Animated View properties
    @State var currentIndex: Int = 0
    
    //Detail View properties
    @State var detailMovie: ProfileModel?
    @State var showDetailView: Bool = false
    @State var detailImage: UIImage = UIImage()
    
    // FOR MATCHED GEOMETRY EFFECT STORING CURRENT CARD SIZE
    @State var currentCardSize: CGSize = .zero
    
    @State private var isLoading: Bool = false
    @State private var showHamburgerMenu: Bool = false
    @State private var filteredCards: [ProfileModel] = []
    
    @State private var isLoadCards: Bool = false
    @State private var cards: [ProfileModel] = []
    @State private var lawd: UIImage = UIImage()
    let storage = Storage.storage()
    
    // Environment Values
    @Namespace var animation
    @Environment (\.colorScheme) var scheme
    
    var body: some View {
        GeometryReader{geoReader in
            ZStack{
                BGView()
                
                Header(showHamburgerMenu: $showHamburgerMenu, isLoading: $isLoading, foodFilter: $homeViewModel.foodFilter, filteredCards: $filteredCards, homeViewModel: homeViewModel)
                
                ZStack{
                    SnapCarousel(spacing: 20,trailingSpace: 110, index: $currentIndex, items: self.cards){profile in
                        GeometryReader{proxy in
                            let size = proxy.size

                            CardViewCarousel(size: size,profile: profile, detailMovie: $detailMovie, showDetailView: $showDetailView, currentCardSize: $currentCardSize, detailImage: $detailImage)
                        }
                    }
                    // Since Carousel is Moved The current Card a little bit up
                    //Using padding to avoid the Undercovering the top element
                    .padding(.top,50)
                    .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.35)
                    
                    Footer()
                        .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.77)
                }
                .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.6)
                .overlay{
                    if let profile = detailMovie,showDetailView{
                        DetailView(profile: profile, showDetailVew: $showDetailView, detailMovie: $detailMovie, currentCardSize: $currentCardSize, detailImage: $detailImage, animation: animation)
                    }
                }
            }
            .onAppear{
                homeViewModel.getUserProfile() {(userProfileId) -> Void in
                    if userProfileId != "" {
                        //get profileImage
                        homeViewModel.getImageStorageFile(profileId: userProfileId)
                        
                        if !isLoadCards && filteredCards.isEmpty {
                            getProfiles(filterProfileIds: []){(profiles) in
                                if !profiles.isEmpty {
                                    filterCards(){(selfCards) in
                                        if !selfCards.isEmpty{
                                          print("")
                                        }
                                    }
                                }
                            }
                        }else if !filteredCards.isEmpty {
                            self.cards.removeAll()
                            self.cards = filteredCards.shuffled()
                            filterCards(){(selfCards) in
                                if !selfCards.isEmpty{
                                    print("selfCards completed")
                                }
                            }
                        }else {
                            filterCards(){(selfCards) in
                                if !selfCards.isEmpty{
                                    print("selfCards compelted")
                                }
                            }
                        }
                        
                    } else {
                        homeViewModel.createUserProfile() {(newUserProfileId) -> Void in
                            if newUserProfileId != "" {
                                //showAddImagePopover.toggle()
                                
                                if !isLoadCards && filteredCards.isEmpty {
                                    getProfiles(filterProfileIds: []){(profiles) in
                                        if !profiles.isEmpty {
                                            filterCards(){(selfCards) in
                                                if !selfCards.isEmpty{
                                                    isLoadCards.toggle()
                                                }
                                            }
                                            
                                        }
                                    }
                                }else if !filteredCards.isEmpty {
                                    self.cards.removeAll()
                                    self.cards = filteredCards.shuffled()
                                    filterCards(){(selfCards) in
                                        if !selfCards.isEmpty{
                                            print("cards loaded")
                                        }
                                    }
                                }else {
                                    filterCards(){(selfCards) in
                                        if !selfCards.isEmpty{
                                            print("cards loaded")
                                        }
                                    }
                                }
                            }
                        }
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
    }
    
    //Custom Indicator
    @ViewBuilder
    private func CustomIndicator()->some View{
        HStack(spacing: 5){
            ForEach(self.cards.indices, id: \.self){index in
                Circle()
                    .fill(currentIndex == index ? .blue : .gray.opacity(0.5))
                    .frame(width: currentIndex == index ? 10 : 6, height: currentIndex == index ? 10 : 6)
            }
        }
        .animation(.easeInOut, value: currentIndex)
    }
    
    // Blurred BG
    @ViewBuilder
    private func BGView()->some View{
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
    
    //Footer
    private func Footer()->some View{
        VStack{
            CustomIndicator()
            
            HStack{
                Text("Bunches")
                    .font(.title3.bold())
                Spacer()
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 15){
                    ForEach(mockBunches){bunch in
                        Button{
                            //                            NavigationLink(destination: EventView(event: , viewModel: cardViewModel)){
                            //
                            //                            }
                        }label:{
                            VStack{
                                Image(bunch.artwork)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60, height: 80)
                                    .background(.gray.opacity(0.2))
                                    .cornerRadius(15)
                                    .dropDestination(for: Image.self) { items, locations in
                                        return true
                                    }
                                
                                Text(bunch.movieTitle)
                                    .font(.system(size: 12))
                                    .foregroundColor(.black)
                            }
                        }
                        
                    }
                    
                    Button{
                        
                    }label: {
                        VStack{
                            Image(systemName: "plus")
                                .frame(width: 60, height: 80)
                                .background(.gray.opacity(0.5))
                                .cornerRadius(15)
                                .dropDestination(for: Image.self) { items, locations in
                                    return true
                                }
                            
                            Text("Add new bunch")
                                .font(.system(size: 12))
                                .foregroundColor(.black)
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
                                let profile = ProfileModel(id: data["id"] as? String ?? "", fullName: data["fullName"] as? String ?? "", location: data["location"] as? String ?? "", description: data["description"] as? String ?? "", gender: data["gender"] as? String ?? "", age: data["age"] as? String ?? "", fcmTokens: data["fcmTokens"] as? [String] ?? [], messageThreadIds: data["messageThreadIds"] as? [String] ?? [],occupation: data["occupation"] as? String ?? "", favRestaurant: data["favRestaurant"] as? String ?? "" , favFood: data["favFood"] as? String ?? "", hobbies: data["hobbies"] as? [String] ?? [], eventIds: data["eventIds"] as? [String] ?? [], isMockData: data["isMockData"] as? Bool ?? false)
                                self.cards.append(profile)
                            }
                        }
                        // very stupid but I have to do this. There is no shuffle()
                        var shuffled = self.cards.shuffled()
                        self.cards = shuffled
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
                        .limit(to: 20)
                        .getDocuments() {(querySnapshot, err) in
                            if let err = err {
                                print("Error getting documents: \(err)")
                                completed([])
                            }else {
                                for document in querySnapshot!.documents {
                                    let data = document.data()
                                    if !data.isEmpty{
                                        let profile = ProfileModel(id: data["id"] as? String ?? "", fullName: data["fullName"] as? String ?? "", location: data["location"] as? String ?? "", description: data["description"] as? String ?? "", gender: data["gender"] as? String ?? "", age: data["age"] as? String ?? "", fcmTokens: data["fcmTokens"] as? [String] ?? [], messageThreadIds: data["messageThreadIds"] as? [String] ?? [],occupation: data["occupation"] as? String ?? "", favRestaurant: data["favRestaurant"] as? String ?? "" , favFood: data["favFood"] as? String ?? "", hobbies: data["hobbies"] as? [String] ?? [], eventIds: data["eventIds"] as? [String] ?? [], isMockData: data["isMockData"] as? Bool ?? false)
                                        profiles.append(profile)
                                    }
                                }
                                completed(profiles)
                            }
                            
                        }
                )
            }
        }
    }
}

struct HomeViewCarousel_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewCarousel()
    }
}

