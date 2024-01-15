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
    
    @State private var searchText: String = ""
    @State private var startSearch: Bool = false
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
        }
        .addSpotlightOverlay(show: $showSpotlight, currentSpot: $currentSpot)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewRouter())
    }
}
