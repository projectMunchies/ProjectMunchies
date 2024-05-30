//
//  ContentView2.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 5/30/24.
//

import SwiftUI
import MapKit

struct HomeView: View {
    @State private var showSheet: Bool = false
    @State private var activeTab: NavBarTabsModel = .filter
    @State private var ignoreTabBar: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom){
            /// This Supports iOS 16
            if #available(iOS 17, *) {
                Map(initialPosition: .region(.applePark))
                    .preferredColorScheme(.dark)
            } else {
                Map(coordinateRegion: .constant(.applePark))
                    .preferredColorScheme(.dark)
            }
            
            subHeaderSection()
                .position(x: 200, y: 10)
            
            /// Tab Bar
            TabBar()
                .frame(height: 49)
                .background(.regularMaterial)
        }
        .task {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) {
            ScrollView(.vertical, content: {
                VStack(alignment: .leading, spacing: 10, content: {
                    Text(activeTab.rawValue)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Toggle("Ignore Tab Bar", isOn: $ignoreTabBar)
                    
                    if (activeTab == .filter) {
                        FilterView()
                    } else if (activeTab == .liveReviews) {
                        LiveReviewsView()
                    } else if (activeTab == .crunchAI) {
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
                    }
                })
                .padding()
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .presentationDetents([.height(60), .medium, .large])
            .presentationCornerRadius(20)
            .presentationBackground(.regularMaterial)
            .presentationBackgroundInteraction(.enabled(upThrough: .large))
            .interactiveDismissDisabled()
            /// Add for inside sheet view
            .bottomMaskForSheet(mask: !ignoreTabBar)
            
        }
    }
    
    /// Tab Bar
    @ViewBuilder
    func TabBar() -> some View {
        HStack(spacing: 0) {
            ForEach(NavBarTabsModel.allCases, id: \.rawValue) { tab in
                Button(action: { activeTab = tab }, label: {
                    VStack(spacing: 2){
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
    
    private func subHeaderSection() -> some View {
        HStack {
            Header()
        }
    }
}

#Preview {
    HomeView()
}

extension MKCoordinateRegion {
    /// Apple Mark Region
    static var applePark: MKCoordinateRegion {
        let center = CLLocationCoordinate2D(latitude: 37.334606, longitude: -122.009102)
        return .init(center: center, latitudinalMeters: 10000, longitudinalMeters: 10000)
    }
}
