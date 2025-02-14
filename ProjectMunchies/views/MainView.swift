//
//  MainView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 5/30/24.
//

import SwiftUI
import MapKit

struct MainView: View {
    @StateObject var locationManager: LocationManager = .init()
    @StateObject private var venuesViewModel = VenuesViewModel()
    @EnvironmentObject var profilesViewModel:
    ProfilesViewModel
    
    @State private var showSheet: Bool = false
    @State private var ignoreTabBar: Bool = true
    @State private var isNotifcation: Bool = false
    @State private var isCreateReviewOverlay: Bool = false
    @State private var sheetIndents: Set<PresentationDetent> = [.height(60), .medium, .large]
    @State private var settingsDetent: PresentationDetent = .height(60)
    @State private var locationsInRegion: [CLLocation] = [CLLocation(latitude: -82, longitude: 20.0),
        CLLocation(latitude: -82, longitude: 20.0)]
    
    var body: some View {
        ZStack(alignment: .bottom){
            MapViewHelper()
                .environmentObject(locationManager)
                .navigationBarHidden(true)
                .preferredColorScheme(.dark)
                .disabled(isCreateReviewOverlay)
            
            SubHeaderSection()
                .position(x: 200, y: 10)
            
                Button(action: {
                    self.isNotifcation = true
            }) {
                Text("send notification")
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .buttonStyle(PlainButtonStyle())
            .position(x: 200, y: 250)
            
            
            TabBar()
                .frame(height: 49)
                .background(.regularMaterial)
        }
  
//            VStack {
//                ScrollView {
//                    VStack {
//                        ForEach(locationManager.UIRows.keys.sorted(), id: \.self) {condition in
//                            HStack(alignment: .top) {
//                                Button(action: {
//                                    Task {
//                                        await locationManager.monitor?.remove(condition)
//                                        await locationManager.updateRecords()
//                                    }
//                                }) {
//                                    Image(systemName: "xmark.circle")
//                                }
//                                Text(condition)
//                                ScrollViewReader {reader in
//                                    ScrollView {
//                                        VStack {
//                                            ForEach((locationManager.UIRows[condition] ?? []).indices, id: \.self) {index in
//                                                HStack {
//                                                    switch locationManager.UIRows[condition]![index].state {
//                                                    case .satisfied: Text("Satisfied")
//                                                    case .unsatisfied: Text("Unsatisfied")
//                                                    case .unknown: Text("Unknown")
//                                                    case .unmonitored: Text("Unmonitored")
//                                                    @unknown default:
//                                                        fatalError()
//                                                    }
//                                                    Text(locationManager.UIRows[condition]![index].date, style: .time)
//                                                }
//                                            }
//                                            Text("")
//                                                .frame(height: 5)
//                                                .id("lastElement")
//                                        }
//                                    }
//                                    .frame(height: 40)
//                                    .onChange(of: locationManager.UIRows[condition]?.count) {
//                                        reader.scrollTo("lastElement")
//                                        Task {
//                                            sleep(1)
//                                            withAnimation(.easeInOut(duration: 3)) {
//                                                reader.scrollTo(0)
//                                            }
//                                        }
//                                    }
//                                }
//                            }
//                        }
//                        .padding(20)
//                    }
//                }
//            }
        .task() {
            do {
                // fixes bug on startup for bottomMaskForSheet()
                ignoreTabBar.toggle()
                
                if !isCreateReviewOverlay {
                    showSheet = true
                }
                
                try await profilesViewModel.GetUserProfile()
                try await getNewMapAlerts()
                
            } catch {
                // HANDLE ERROR
            }
        }
        .onChange(of: locationManager.fetchedPlaces) {
            displayMapMarkers()
        }
        .onChange(of: self.isNotifcation) {
            Task {
                do {
                  locationManager.launchNotification()
                } catch {
                    
                }
            }
            
        
        }
        .sheet(isPresented: $showSheet) {
            ScrollView(.vertical, content: {
                VStack(alignment: .leading, spacing: 15, content: {
                    
                    Text(locationManager.activeTab.rawValue)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.leading)
                    //                    Toggle("Ignore Tab Bar", isOn: $ignoreTabBar)
                    
                    SheetViews(activeTab: locationManager.activeTab)
                    
                })
                .padding()
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .presentationDetents(self.sheetIndents, selection: self.$settingsDetent)
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
            ForEach(NavBarTabsModel.mainCases, id: \.rawValue) { tab in
                // filters out views not in the navBar
                if(tab != .bunchies && tab != .venue) {
                    Button(action: { locationManager.activeTab = tab }, label: {
                        VStack(spacing: 2){
                            Image(systemName: tab.symbol)
                                .font(.title2)
                            
                            Text(tab.rawValue)
                                .font(.caption2)
                        }
                        .foregroundStyle(locationManager.activeTab == tab ? Color.accentColor : .gray)
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
            Header(sheetIndents: self.$sheetIndents, activeTab: $locationManager.activeTab)
        }
    }
    
    public func SheetViews(activeTab: NavBarTabsModel) -> some View {
        HStack{
            Spacer()
            switch (activeTab) {
            case .home:
                HomeView(sheetIndents: self.$sheetIndents,settingsDetent: self.$settingsDetent)
            case .filter:
                FilterView()
            case .liveReviews:
                LiveReviewsView()
            case .explore:
                VideoPlayerHomeView(showOverlay: false)
            case .crunchAI:
                CrunchAIView(searchText: .constant(""), startSearch: .constant(false), position: .constant(MapCameraPosition.region (MKCoordinateRegion(
                    center: CLLocationCoordinate2D(
                        latitude: 27.9506,
                        longitude: -82.4572
                    ),
                    span: MKCoordinateSpan(
                        latitudeDelta: 0.1,
                        longitudeDelta: 0.1
                    )
                ))))
            case .bunchies:
                BunchiesView(sheetIndents: self.$sheetIndents, activeTab: $locationManager.activeTab)
            case .settings:
                SettingsView(sheetIndents: self.$sheetIndents,
                             settingsDetent: self.$settingsDetent)
            case .venue:
                VenueView(sheetIndent: self.$sheetIndents, activeTab: $locationManager.activeTab)
                    .environmentObject(locationManager)
            }
            Spacer()
        }
    }
    
    private func getNewMapAlerts() async throws {
        try await venuesViewModel.GetMapAlerts()
        
        locationManager.search(value: venuesViewModel.reviewVenues.first!.name, alertType: "reviews")
        
        locationManager.search(value: venuesViewModel.specialVenues.first!.name, alertType: "specials")
    }
    
    private func displayMapMarkers() {
        if let places = locationManager.fetchedPlaces,!places.isEmpty {
            let annotations = createAnnotations(venueDTOS: places)
            
            if (!annotations.isEmpty) {
                plotPoints(annotations: annotations)
            }
        }
    }
    
    private func createAnnotations(venueDTOS: [VenueModelDTO]) -> [MKPointAnnotation] {
        var annotations:[MKPointAnnotation] = []
        
        for venueDTO in venueDTOS {
            let annotation = MKPointAnnotation()
            annotation.coordinate = venueDTO.coordinates ?? CLLocationCoordinate2D()
            annotation.title = venueDTO.name
            annotation.subtitle = venueDTO.mapAlertType
            annotations.append(annotation)
        }
        
        return annotations
    }
    
    private func plotPoints(annotations: [MKPointAnnotation]) {
        let placeMark = MKPlacemark(
            coordinate: annotations.first!.coordinate,
            addressDictionary: ["name": "What is in Mkplaemark?"]
        )
        let closestPlace = CLPlacemark(placemark: placeMark)
        
        if let coordinate = closestPlace.location?.coordinate{
            locationManager.addDraggablePin(coordinate: coordinate, annotations: annotations)
        }
    }
    
    struct ErrorView: View {
        @State var errorMessage: String
        
        var body: some View {
            GroupBox {
                HStack {
                    Image(systemName: "exclamationmark.triangle")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text(errorMessage)
                }
            }
            .padding(20)
            .cornerRadius(1)
        }
    }
}

#Preview {
    MainView()
        .environmentObject(ProfilesViewModel())
}
