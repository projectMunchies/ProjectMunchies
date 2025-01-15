//
//  SearchView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 6/2/24.
//

import SwiftUI
import MapKit

struct MapViewHelper: View{
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View{
        ZStack{
            MapViewDisplay()
                .environmentObject(locationManager)
                .ignoresSafeArea()
        }
        .onDisappear {
            locationManager.pickedPlaceMark = nil
            locationManager.mapView.removeAnnotations(locationManager.mapView.annotations)
        }
    }
}

struct MapViewDisplay: UIViewRepresentable{
    @EnvironmentObject var locationManager: LocationManager
    func makeUIView(context: Context) -> MKMapView {
        return locationManager.mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

#Preview {
    MapViewHelper()
        .environmentObject(LocationManager())
}
