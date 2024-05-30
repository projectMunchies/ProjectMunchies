//
//  CrunchAIView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 5/30/24.
//

import SwiftUI
import MapKit

struct CrunchAIView: View {
    @State private var showModal: Bool = false
    @Binding var searchText: String
    @Binding var startSearch: Bool
    @Binding var position: MapCameraPosition
    @State private var showVenueFilter: Bool = false
    @State private var currentVenue: VenueModel = emptyVenueModel
    
    var body: some View {
        VStack{
            Text("What should I eat today?")
                .font(.title)
                .multilineTextAlignment(.center)
            
            RecommendationModal(showModal: $showModal, startSearch: $startSearch, searchText: $searchText, position: $position, showVenueFilter: $showVenueFilter, venue: $currentVenue)
        }
    }
}

#Preview {
    CrunchAIView(searchText: .constant(""), startSearch: .constant(false), position:
            .constant(MapCameraPosition.region (MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: 27.9506,
                    longitude: -82.4572
                ),
                span: MKCoordinateSpan(
                    latitudeDelta: 0.1,
                    longitudeDelta: 0.1
                )
            )))
    )
}
