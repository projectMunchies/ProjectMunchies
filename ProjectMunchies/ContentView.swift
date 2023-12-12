//
//  ContentView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/27/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var selectedTab = 0
    @State private var searchText: String = ""
    @State private var showFilter: Bool = false
    @State private var startSearch: Bool = false
    @State private var categoryIndex: Int = 0
    @State private var categoryTypeIndex: Int = 0
    @State private var mainCategories: [Category] = [
        Category(id: 1, name:"Food", icon: "foodIcon"),
        Category(id: 2, name:"Drinks", icon: "drinkIcon"),
        Category(id: 3, name:"Happy Hour", icon: "happyHourIcon")
    ]
    
    @State private var cuisineTypes: [CategoryType] = [
        CategoryType(id: 1, name: "Chinese", icon: "chineseFoodIcon"),
        CategoryType(id: 2, name: "American", icon: "americanFoodIcon"),
        CategoryType(id: 3, name: "Mexican", icon: "mexicanFoodIcon"),
        CategoryType(id: 4, name: "Japanese", icon: "japaneseFoodIcon"),
        CategoryType(id: 5, name: "Indian", icon: "indianFoodIcon"),
        CategoryType(id: 6, name: "Italian", icon: "italianFoodIcon"),
        CategoryType(id: 7, name: "Thai", icon: "thaiFoodIcon"),
        CategoryType(id: 8, name: "French", icon: "frenchFoodIcon")
    ]
    
    @State private var drinkTypes: [CategoryType] = [
        CategoryType(id: 1, name: "Juice", icon: "juiceIcon"),
        CategoryType(id: 2, name: "Smoothie", icon: "smoothieIcon"),
        CategoryType(id: 3, name: "Soda", icon: "sodaIcon"),
        CategoryType(id: 4, name: "Tea", icon: "teaIcon"),
        CategoryType(id: 5, name: "Coffee", icon: "coffeeIcon"),
        CategoryType(id: 6, name: "Hot Chocolate", icon: "hotChocolateIcon")
    ]
    
    @State private var happHourTypes: [CategoryType] = [
        CategoryType(id: 1, name: "Liquor", icon: "liquorIcon"),
        CategoryType(id: 2, name: "Beer", icon: "beerIcon"),
        CategoryType(id: 3, name: "Wine", icon: "wineIcon"),
        CategoryType(id: 4, name: "Margarita", icon: "margaritaIcon"),
        CategoryType(id: 5, name: "Cocktail", icon: "cocktailIcon")
    ]
    
    var body: some View {
        GeometryReader{ geoReader in
            ZStack{
                TabView(selection: $selectedTab) {
                    HomeView(searchText: self.$searchText, startSearch: self.$startSearch)
                        .tag(0)
                        .toolbar(.hidden, for: .tabBar)
                    SettingsView()
                        .tag(1)
                        .toolbar(.hidden, for: .tabBar)
                    //                    VideoPlayerHomeView(showOverlay: false)
                    //                        .tag(2)
                    //                        .toolbar(.hidden, for: .tabBar)
                    
                    //                    EventsView()
                    //                        .tag(3)
                    //                        .toolbar(.hidden, for: .tabBar)
                }
                
                displayCustomTab(geoReader: geoReader)
            }
            .sheet(isPresented: $showFilter) {
                displayFilterSheet(geoReader: geoReader)
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
            }
        }
    }
    
    private func displayCustomTab(geoReader: GeometryProxy) -> some View {
        ZStack{
            ZStack{
                HStack{
                    ForEach((TabbedItems.allCases), id: \.self){ item in
                        Button{
                            selectedTab = item.rawValue
                        } label: {
                            CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                        }
                        if item.rawValue == 0  {
                            Spacer()
                                .frame(width: 150)
                        }
                    }
                }
                .padding(6)
            }
            .frame(height: 70)
            .background(.indigo.opacity(0.8))
            .cornerRadius(35)
            .padding(.horizontal, 26)
            .position(x: geoReader.frame(in: .local).midX, y: geoReader.size.height * 0.97)
            
            //  if selectedTab == 0 {
            Button(action: {
                self.showFilter.toggle()
            }) {
                ZStack{
                    Text("")
                        .frame(width: 65, height: 65)
                        .background(.white.opacity(0.9))
                        .cornerRadius(40)
                    
                    Image("crunchBunchAppIcon")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
            }
            .disabled(selectedTab != 0 ? true : false)
            .position(x: geoReader.frame(in: .local).midX, y: geoReader.size.height * 0.93)
            // }
        }
        
        
    }
    
    private func displayFilterSheet(geoReader: GeometryProxy) -> some View {
        VStack{
            VStack{
                HStack{
                    Text("Category")
                        .font(.system(size: 20))
                        .padding(.leading,geoReader.size.width * 0.02)
                    Spacer()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(self.mainCategories) { i in
                            
                            Button(action: {
                                categoryIndex = i.id
                                self.searchText = i.name
                            }){
                                VStack{
                                    ZStack{
                                        Circle()
                                            .foregroundColor(self.categoryIndex == i.id ? .green : .gray)
                                            .frame(width: 90, height: 90)
                                        
                                        Image(i.icon)
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                            .font(.system(size: 35))
                                            .foregroundColor(.black)
                                    }
                                    Text(i.name)
                                }
                                .padding(.leading)
                                
                                
                            }
                        }
                    }
                }
            }
            
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
    
    private func switchCategoryTypes() -> [CategoryType]{
        switch categoryIndex {
        case 1:
            return cuisineTypes
        case 2:
            return drinkTypes
        case 3:
            return happHourTypes
        default:
            return [CategoryType(id: 1, name: "", icon: "")]
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewRouter())
    }
}

enum TabbedItems: Int, CaseIterable{
    case home = 0
    case settings
    //    case videoPlayer
    //    case liveFeed
    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .settings:
            return "Settings"
            //        case .videoPlayer:
            //            return "VideoPlayer"
            //        case .liveFeed:
            //            return "LiveFeed"
        }
    }
    
    var iconName: String{
        switch self {
        case .home:
            return "homeIcon"
        case .settings:
            return "settingsIcon"
            //        case .videoPlayer:
            //            return "playerIcon"
            //        case .liveFeed:
            //            return "feedIcon"
        }
    }
}

struct Category: Identifiable {
    var id: Int
    var name: String
    var icon: String
}

struct CategoryType: Identifiable {
    var id: Int
    var name: String
    var icon: String
}
