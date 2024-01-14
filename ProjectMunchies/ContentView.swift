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
    
    @State private var selectedTab = 0
    @State private var searchText: String = ""
    @State private var showFilter: Bool = false
    @State private var startSearch: Bool = false
    @State private var categoryIndex: Int = 0
    @State private var categoryTypeIndex: Int = 0
    @State private var showSpotlight: Bool = false
    @State private var currentSpot: Int = 0
    @State private var showModal: Bool = false
    @State private var showVenueFilter: Bool = false
    @State private var venue: VenueModel = venueSample
    @State private var position: MapCameraPosition = MapCameraPosition
        .region (MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 27.9506,
                longitude: -82.4572
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 0.1,
                longitudeDelta: 0.1
            )
        ))
    
    var body: some View {
        GeometryReader{ geoReader in
            ZStack{
                TabView(selection: $selectedTab) {
                    HomeView(searchText: self.$searchText, startSearch: self.$startSearch, showModal: self.$showModal, position: $position)
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
                .blur(radius: showModal ? 5 : 0)
                
                displayCustomTab(geoReader: geoReader)
                
                if showModal {
                    VStack{
                        HStack{
                            Spacer()
                            
                            Button(action: {
                                withAnimation{
                                    showModal.toggle()
                                }
                            }){
                                ZStack{
                                    Circle()
                                        .foregroundColor(.red)
                                    
                                    Image(systemName: "xmark")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.white)
                                }
                                .frame(width: 50, height: 50)
                                .padding(.trailing,20)
                            }
                        }
                        
                        Text("What should I eat today?")
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                        
                        RecommendationModal(showModal: $showModal, startSearch: $startSearch, searchText: $searchText, position: $position, showVenueFilter: $showVenueFilter, venue: $venue)
                    }
                    //.zIndex(3)
                    .position(x: geoReader.frame(in: .local).midX, y: geoReader.size.height * 0.6)
                }
            }
            .sheet(isPresented: $showFilter) {
                displayFilterSheet(geoReader: geoReader)
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
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
            .onAppear {
                //showSpotlight = true
            }
            .onChange(of:currentSpot) {
                if currentSpot == 4 {
                    withAnimation{
                        showModal.toggle()
                    }
                }
            }
        }
        .addSpotlightOverlay(show: $showSpotlight, currentSpot: $currentSpot)
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
                //                .addSpotlight(0, shape: .circle, roundedRadius: 10, text: "Use filter to find great cusine \noptions in your area! \ntap screen to continue")
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
                        ForEach(mainCategories) { i in
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewRouter())
    }
}
