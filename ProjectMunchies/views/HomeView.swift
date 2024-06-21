//
//  HomeView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 5/30/24.
//

import SwiftUI
import MapKit
import Contacts
import ContactsUI

struct HomeView: View {
    @StateObject var locationManager: LocationManager = .init()
    @StateObject private var venuesViewModel = VenuesViewModel()
    
    @State private var showBunchiesView = false
    @State private var showChatView = false
    @State private var selectedChatContact: CNContact?
    @State var navigationTag: String?
    @State private var showSheet: Bool = false
    @State private var ignoreTabBar: Bool = true
    @State private var isCreateReviewOverlay: Bool = false
    @State private var activeTab: NavBarTabsModel = .filter
    @State private var sheetIndents: Set<PresentationDetent> = [.height(60), .medium, .large]
    
    var body: some View {
        ZStack(alignment: .bottom){
            MapViewSelection()
                .environmentObject(locationManager)
                .navigationBarHidden(true)
                .preferredColorScheme(.dark)
                .disabled(isCreateReviewOverlay)
            
            SubHeaderSection()
                .position(x: 200, y: 10)
            
            TabBar()
                .frame(height: 49)
                .background(.regularMaterial)
        }
        .task() {
            do {
                // fixes bug on startup for bottomMaskForSheet()
                ignoreTabBar.toggle()
                
                if !isCreateReviewOverlay {
                    showSheet = true
                }
                
                try await getNewMapAlerts()
                
            } catch {
                // HANDLE ERROR
            }
        }
        .onChange(of: locationManager.fetchedPlaces) {
            displayMapMarkers()
        }
        .sheet(isPresented: $showSheet) {
            ScrollView(.vertical, content: {
                VStack(alignment: .leading, spacing: 15, content: {
                    Text(activeTab.rawValue)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Toggle("Ignore Tab Bar", isOn: $ignoreTabBar)
                    SheetViews(activeTab: self.activeTab)
                    
                })
                .padding()
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .presentationDetents(self.sheetIndents)
            .presentationCornerRadius(20)
            .presentationBackground(.regularMaterial)
            .presentationBackgroundInteraction(.enabled(upThrough: .large))
            .interactiveDismissDisabled()
            .bottomMaskForSheet(mask: !ignoreTabBar)
        }
        .blur(radius: isCreateReviewOverlay ? 10 : 0 )
        .overlay {
            if isCreateReviewOverlay {
                CreateReviewOverlay(isCreateReviewOverlay: self.$isCreateReviewOverlay, showSheet: self.$showSheet)
            }
        }
    }
    
    @ViewBuilder
    func TabBar() -> some View {
        HStack(spacing: 0) {
            ForEach(NavBarTabsModel.allCases, id: \.rawValue) { tab in
                // filters out views not in the navBar
                if tab != .venue {
                    Button(action: { activeTab = tab }, label: {
                        VStack(spacing: 2) {
                            Image(systemName: tab.symbol)
                                .font(.title2)
                            
                            Text(tab.rawValue)
                                .font(.caption2)
                        }
                        .foregroundStyle(activeTab == tab ? Color.accentColor : .gray)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .contentShape(.rect)
                    })
                    .buttonStyle(.plain)
                }
            }
        }
    }
    
    @ViewBuilder
    private func SubHeaderSection() -> some View {
        HStack {
            Header(sheetIndents: self.$sheetIndents, activeTab: self.$activeTab)
        }
    }
    
    
    public func SheetViews(activeTab: NavBarTabsModel) -> some View {
        VStack {
            switch (activeTab) {
            case .filter:
                FilterView()
            case .liveReviews:
                LiveReviewsView()
            case .explore:
                VideoPlayerHomeView(showOverlay: false)
            case .crunchAI:
                CrunchAIView(searchText: .constant(""), startSearch: .constant(false), position: .constant(MapCameraPosition.region(MKCoordinateRegion(
                    center: CLLocationCoordinate2D(
                        latitude: 27.9506,
                        longitude: -82.4572
                    ),
                    span: MKCoordinateSpan(
                        latitudeDelta: 0.1,
                        longitudeDelta: 0.1
                    )
                ))))
            case .profile:
                ProfileView(sheetIndents: self.$sheetIndents, activeTab: self.$activeTab)
                
            case .venue:
                VenueView(sheetIndent: self.$sheetIndents, activeTab: self.$activeTab)
                    .environmentObject(locationManager)
            }
        }
    }
    
    private func getNewMapAlerts() async throws {
        try await venuesViewModel.GetMapAlerts()
        
        if let firstReviewVenue = venuesViewModel.reviewVenues.first {
            locationManager.search(value: firstReviewVenue.name)
        }
        
        if let firstSpecialVenue = venuesViewModel.specialVenues.first {
            locationManager.search(value: firstSpecialVenue.name)
        }
    }
    private func displayMapMarkers() {
        if let places = locationManager.fetchedPlaces,!places.isEmpty {
            
            let venueDTOS = createVenueDTOs(places: places)
            let annotations = createAnnotations(venueDTOS: venueDTOS)
            
            if (!annotations.isEmpty) {
                plotPoints(coordinate: annotations.first!, annotations: annotations)
            }
            
            self.activeTab = .venue
        }
    }
    
    private func createVenueDTOs(places: [CLPlacemark]) -> [VenueModelDTO] {
        var venueDTOs: [VenueModelDTO] = []
        
        for place in places  {
            let venueDTO = VenueModelDTO(
                id: "",
                name: place.name!,
                coordinates: place.location!.coordinate
            )
            venueDTOs.append(venueDTO)
        }
        
        return venueDTOs
    }
    
    private func createAnnotations(venueDTOS: [VenueModelDTO]) -> [MKPointAnnotation] {
        var annotations:[MKPointAnnotation] = []
        
        for venueDTO in venueDTOS {
            let annotation = MKPointAnnotation()
            annotation.coordinate = venueDTO.coordinates
            annotation.title = venueDTO.name
            
            annotations.append(annotation)
        }
        
        return annotations
    }
    
    private func plotPoints(coordinate: MKPointAnnotation, annotations: [MKPointAnnotation]) {
        let placeMark = MKPlacemark(
            coordinate: annotations.first!.coordinate,
            addressDictionary: ["name": "What is in Mkplaemark?"]
        )
        let closestPlace = CLPlacemark(placemark: placeMark)
        
        if let coordinate = closestPlace.location?.coordinate{
            //                    locationManager.pickedLocation = .init(latitude: coordinate.latitude, longitude: coordinate.longitude)
            //                    locationManager.mapView.region = .init(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            locationManager.addDraggablePin(coordinate: coordinate, annotations: annotations)
            //                    locationManager.updatePlacemark(location: .init(latitude: coordinate.latitude, longitude: coordinate.longitude))
        }
    }
}

#Preview {
    HomeView()
}
