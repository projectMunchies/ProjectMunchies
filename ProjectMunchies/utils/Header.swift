//
//  Header.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 8/12/23.
//

import SwiftUI

struct Header: View {
    @Binding var showHamburgerMenu: Bool
    @Binding var isLoading: Bool
    @Binding var foodFilter: FoodFilterModel
    @Binding var filteredCards: [ProfileModel]
    
    let homeViewModel: HomeViewModel
    
    @State private var showPrefPopover: Bool = false
    @State private var showIntroPopover: Bool = false
    @State private var foodFilterCategory = "Cuisine"
    @State private var foodFilterType = "Pick"
    @State private var foodFilterGender = "Pick"
    @State private var foodFilterLocation = "Pick"
    @State private var foodFilterAgeRangeFrom: Int = 18
    @State private var foodFilterAgeRangeTo: Int = 70
    
    let cuisineTypes = ["Chinese","American","Mexican","Japanese","Indian","Italian","Thai","French"]
    let drinkTypes = ["Juice","Smoothies","Soda","Tea","Coffee","Hot Chocolate"]
    let happHourTypes = ["Liquor","Beer","Wine","Margaritas","Cocktails"]
    let gender = ["Male","Female"]
    let mainCategories = ["Cuisine","Drinks","Happy Hour"]
    let locations = ["Tampa, Fl","Clearwater, Fl", "St.Petersburg, Fl"]
    
    var body: some View {
        GeometryReader{ geoReader in
            headerSection(for: geoReader)
        }
    }
    
    public func headerSection(for geoReader: GeometryProxy) -> some View {
        HStack{
            Spacer()
            HStack(spacing: 10){
                Button(action: {
                    withAnimation{
                        self.showHamburgerMenu.toggle()
                    }
                }) {
                    Image(systemName: "line.3.horizontal")
                        .resizable()
                        .frame(width: 25, height: 20)
                        .font(.system(size: 35))
                        .foregroundColor(.black)
                }
                
                ZStack{
                    Image("crunchBunchAppIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geoReader.size.width * 0.08, height: geoReader.size.height * 0.08)
                        .position(x:geoReader.size.width * 0.01, y:geoReader.size.height * 0.5)
                    
                    Image("crunchBunchText")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geoReader.size.width * 0.4, height: geoReader.size.height * 0.4)
                        .position(x:geoReader.size.width * 0.24, y:geoReader.size.height * 0.505)
                }
            }
            
            Spacer()
                .frame(width: geoReader.size.width * 0.15)
            
            HStack(spacing: 20){
                filterIconAndPopover(for: geoReader)
                
                NavigationLink(destination: SettingsView() ) {
                    if !homeViewModel.profileImage.size.height.isZero {
                        Image(uiImage: homeViewModel.profileImage)
                            .resizable()
                            .frame(width: 25, height: 25)
                            .background(Color.black.opacity(0.2))
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                    } else {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .font(.system(size: 35))
                            .foregroundColor(.black)
                    }
                }
                
                introIcon(for: geoReader)
            }
            Spacer()
        }
        .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.03)
    }
    
    private func filterIconAndPopover(for geoReader: GeometryProxy) -> some View {
        VStack{
            Button(action: {
                showPrefPopover.toggle()
            }) {
                Image("filterIcon")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .font(.system(size: 35))
                    .foregroundColor(.black)
                    .popover(isPresented: $showPrefPopover) {
                        ZStack{
                            Color.white
                            
                            VStack{
                                Form {
                                    Section {
                                        Picker("", selection: $foodFilterCategory) {
                                            ForEach(mainCategories, id: \.self) {
                                                Text($0)
                                            }
                                        }
                                        .pickerStyle(.segmented)
                                        .colorMultiply(.gray)
                                    }
                                    .listRowBackground(Color.white)
                                    
                                    Section {
                                        HStack{
                                            Text("Type")
                                                .foregroundColor(.black)
                                            
                                            Spacer()
                                            
                                            Menu{
                                                Picker("", selection: $foodFilterType) {
                                                    ForEach(changeFoodType(), id: \.self) {
                                                        Text($0)
                                                    }
                                                }
                                                .pickerStyle(.automatic)
                                            } label: {
                                                Text("\(self.foodFilterType)")
                                                    .frame(width: geoReader.size.width * 0.2)
                                                    .foregroundColor(.gray)
                                            }
                                        }
                                    }
                                    .listRowBackground(Color.white)
                                    
                                    Section {
                                        HStack{
                                            Text("Gender")
                                                .foregroundColor(.black)
                                            
                                            Spacer()
                                            
                                            Menu{
                                                Picker("", selection: $foodFilterGender) {
                                                    ForEach(gender, id: \.self) {
                                                        Text($0)
                                                            .foregroundColor(.blue)
                                                    }
                                                }
                                                .pickerStyle(.automatic)
                                            } label: {
                                                Text("\(self.foodFilterGender)")
                                                    .frame(width: geoReader.size.width * 0.2)
                                                    .foregroundColor(.gray)
                                            }
                                        }
                                    }
                                    .listRowBackground(Color.white)
                                    
                                    
                                    Section {
                                        HStack{
                                            Text("Location")
                                                .foregroundColor(.black)
                                            
                                            Spacer()
                                            
                                            Menu {
                                                Picker("", selection: $foodFilterLocation) {
                                                    ForEach(locations, id: \.self) {
                                                        Text($0)
                                                            .accentColor(.black)
                                                    }
                                                }
                                                .pickerStyle(.automatic)
                                            } label: {
                                                Text("\(self.foodFilterLocation)")
                                                    .frame(width: geoReader.size.width * 0.2)
                                                    .foregroundColor(.gray)
                                            }
                                        }
                                    }
                                    .listRowBackground(Color.white)
                                    
                                    Section{
                                        HStack{
                                            Text("Age Range From")
                                                .foregroundColor(.black)
                                            
                                            Spacer()
                                            
                                            Menu{
                                                Picker("", selection: $foodFilterAgeRangeFrom) {
                                                    ForEach(Array(stride(from: 18, to: 100, by: 1)), id: \.self) { index in
                                                        Text("\(index)")
                                                    }
                                                }
                                                .pickerStyle(.automatic)
                                            } label: {
                                                Text("\(self.foodFilterAgeRangeFrom)")
                                                    .frame(width: geoReader.size.width * 0.2)
                                                    .foregroundColor(.gray)
                                            }
                                        }
                                    }
                                    .listRowBackground(Color.white)
                                    
                                    Section{
                                        HStack{
                                            Text("Age Range To")
                                                .foregroundColor(.black)
                                            
                                            Spacer()
                                            
                                            
                                            Menu{
                                                Picker("", selection: $foodFilterAgeRangeTo) {
                                                    ForEach(Array(stride(from: 18, to: 100, by: 1)), id: \.self) { index in
                                                        Text("\(index)")
                                                            .foregroundColor(.black)
                                                    }
                                                }
                                                .pickerStyle(.automatic)
                                            } label: {
                                                Text("\(self.foodFilterAgeRangeTo)")
                                                    .frame(width: geoReader.size.width * 0.2)
                                                    .foregroundColor(.gray)
                                            }
                                        }
                                    }
                                    .listRowBackground(Color.white)
                                }
                                .frame(width: geoReader.size.width * 0.85, height: geoReader.size.height * 0.8)
                                .scrollContentBackground(.hidden)
                                
                                Button(action: {
                                    showPrefPopover.toggle()
                                    fakeLoading()
                                    saveFoodFilter(for: geoReader)
                                }) {
                                    Text("Find Foodmate")
                                        .frame(width: 180, height: 60)
                                        .background(Color.green)
                                        .cornerRadius(40)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
            }
        }
        //    <a target="_blank" href="https://icons8.com/icon/83194/news">News</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
    }
    
    private func introIcon(for geoReader: GeometryProxy) -> some View {
        VStack{
            Button(action: {
                withAnimation{
                    self.showIntroPopover.toggle()
                }
            }) {
                Image(systemName: "questionmark.circle")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .font(.system(size: 35))
                    .foregroundColor(.black)
            }
            .popover(isPresented: $showIntroPopover) {
                introPopover(for: geoReader)
            }
        }
    }
    
    private func introPopover(for geoReader: GeometryProxy) -> some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            
            VStack{
                Group{
                    Text("Welcome to Crunch Bunch")
                        .foregroundColor(Color("MainColor"))
                        .font(.custom("Chalkduster", size: geoReader.size.height * 0.035))
                        .multilineTextAlignment(.center)
                    
                    Text("The eat-together group meeting app")
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .font(.system(size: geoReader.size.height * 0.028))
                    
                    Spacer()
                        .frame(height: geoReader.size.height * 0.04)
                    
                    Text("Here's how it works:")
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .font(.system(size: geoReader.size.height * 0.028))
                    
                    Text("- Scroll through profiles to find potential food friends based on your food filter")
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .font(.system(size: geoReader.size.height * 0.028))
                    
                    Text("- Hold and drag profile into the 'Bunches' you created at the bottom of screen, an invite to join will be automatically sent")
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .font(.system(size: geoReader.size.height * 0.028))
                    
                    Spacer()
                        .frame(height: geoReader.size.height * 0.04)
                }
                
                Group{
                    Image("filterIcon")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .font(.system(size: 35))
                        .foregroundColor(.black)
                    
                    Text("Food Filter is located in the the top right ")
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .font(.system(size: geoReader.size.height * 0.028))
                        .padding(.bottom,5)
                    
                    Text("- Use it to find food mates for any occasion, anytime anyday")
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .font(.system(size: geoReader.size.height * 0.028))
                    
                    Spacer()
                        .frame(height: geoReader.size.height * 0.04)
                    
                    Text("Bunches & Events")
                        .bold()
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .font(.system(size: geoReader.size.height * 0.028))
                        .padding(.bottom,5)
                    
                    Text("- Events will automatically be created once matched")
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .font(.system(size: geoReader.size.height * 0.028))
                    
                    Text("- Then you can finalize event a get eating!")
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .font(.system(size: geoReader.size.height * 0.028))
                    
                    Spacer()
                        .frame(height: geoReader.size.height * 0.01)
                }
                
                Button(action: {
                    showIntroPopover.toggle()
                }) {
                    Text("Got it")
                        .font(.system(size: 25))
                        .frame(width: 380, height: 70)
                        .background(Color.green)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                }
                .padding(.top)
            }
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
    
    //not sure if this is still needed
    private func fakeLoading(){
        isLoading.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isLoading.toggle()
        }
    }
    
    private func saveFoodFilter(for geoReader: GeometryProxy){
        //pickers dont work well with Binding props so I used states instead then bind them
        //this also doesnt work well in its own function
        foodFilter.gender = self.foodFilterGender
        foodFilter.ageRangeFrom = String(self.foodFilterAgeRangeFrom)
        foodFilter.ageRangeTo = String(self.foodFilterAgeRangeTo)
        foodFilter.category = String(self.foodFilterCategory)
        foodFilter.type = String(self.foodFilterType)
        
        //updating or creating user's filter
        homeViewModel.getUserFilter() {(userFilter) in
            if userFilter.id != "" {
                homeViewModel.updateUserFilter(userFilterId: userFilter.id,userFilter: foodFilter)
            }else {
                homeViewModel.createUserFilter(userFilter: foodFilter)
            }
        }
        
        // get all filters recently updated that match user's parameters then grab the profile
        homeViewModel.getFilteredRecords(foodFilter: foodFilter, isReset: false) {(foodFilters) in
            if !foodFilters.isEmpty {
                let removeUserProfileId = foodFilters.filter({$0.userProfileId != homeViewModel.userProfile.id})
                let filterProfileIds = removeUserProfileId.map { $0.userProfileId }
                // using state in CardsView() is easier than making my own and passing it into CardsView()
                HomeViewCarousel().getProfiles(filterProfileIds: filterProfileIds) {(profiles) in
                    if !profiles.isEmpty {
                        filteredCards = profiles
                    }
                }
            }
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(showHamburgerMenu: .constant(false), isLoading: .constant(false), foodFilter: .constant(MockService.foodFilterSampleData), filteredCards: .constant(mockProfiles), homeViewModel: HomeViewModel())
    }
}
