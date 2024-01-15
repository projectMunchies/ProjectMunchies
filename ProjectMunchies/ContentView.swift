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
    @State private var showFilter: Bool = true
    @State private var startSearch: Bool = false
    @State private var categoryIndex: Int = 0
    @State private var categoryTypeIndex: Int = 0
    @State private var showSpotlight: Bool = false
    @State private var currentSpot: Int = 0
    @State private var showModal: Bool = false
    @State private var showVenueFilter: Bool = false
    @State private var indent: Int = 80
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
                HomeView(searchText: self.$searchText, startSearch: self.$startSearch, showModal: self.$showModal, position: $position)
                    .tag(0)
                    .toolbar(.hidden, for: .tabBar)
                
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
                    .presentationDetents([.height(CGFloat(indent))])
                    .presentationDragIndicator(.visible)
                    .presentationBackgroundInteraction(
                        .enabled(upThrough: .height(CGFloat(indent))))
                    .interactiveDismissDisabled()
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
    
    private func displayFilterSheet(geoReader: GeometryProxy) -> some View {
        VStack{
            VStack{
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(homeCategories) { i in
                            Button(action: {
                                if categoryIndex == i.id {
                                    categoryIndex = 0
                                } else {
                                    categoryIndex = i.id
                                    self.searchText = i.name
                                }
                            }){
                                VStack{
                                    ZStack{
                                        Circle()
                                            .foregroundColor(self.categoryIndex == i.id ? .green : .gray)
                                            .frame(width: 70, height: 70)
                                        
                                        Image(i.icon)
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                            .font(.system(size: 35))
                                            .foregroundColor(.black)
                                    }
                                    Text(i.name)
                                        .foregroundColor(.white)
                                }
                                .padding(.leading)
                            }
                        }
                        Spacer()
                            .frame(width: 30)
                    }
                }
            }
            .padding(.top, self.indent == 80 ? 50 : 100)
            .onChange(of: categoryIndex) {
                if categoryIndex == 0 {
                    self.indent = 80
                } else {
                    self.indent = 300
                }
            }
            if categoryIndex != 0 {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewRouter())
    }
}
