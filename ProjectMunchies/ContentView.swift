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
                HomeView(searchText: self.$searchText, startSearch: self.$startSearch, position: $position)
                    .tag(0)
                    .toolbar(.hidden, for: .tabBar)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewRouter())
    }
}
