//
//  HomeView.swift
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
    @State private var sheetIndents: Set<PresentationDetent> = [.height(60), .medium, .large]
    
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
            
            SubHeaderSection()
                .position(x: 200, y: 10)
            
            TabBar()
                .frame(height: 49)
                .background(.regularMaterial)
        }
        .task() {
            showSheet = true
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
            /// Add for inside sheet view
            .bottomMaskForSheet(mask: !ignoreTabBar)
            
        }
    }
    
    @ViewBuilder
    func TabBar() -> some View {
        HStack(spacing: 0) {
            ForEach(NavBarTabsModel.allCases, id: \.rawValue) { tab in
                if(tab != .bunchies && tab != .reviews) {
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
    }
    
    @ViewBuilder
    private func SubHeaderSection() -> some View {
        HStack {
            Header(sheetIndents: self.$sheetIndents, activeTab: self.$activeTab)
        }
    }
    
    public func SheetViews(activeTab: NavBarTabsModel) -> some View {
        VStack{
            switch (activeTab) {
            case .filter:
                FilterView()
            case .liveReviews:
                LiveReviewsView()
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
                BunchiesView(sheetIndents: self.$sheetIndents, activeTab: self.$activeTab)
            case .reviews:
                ReviewsView(sheetIndents: self.$sheetIndents, activeTab: self.$activeTab)
            case .settings:
                SettingsView(sheetIndents: self.$sheetIndents, activeTab: self.$activeTab)
            }
        }
    }
}

#Preview {
    HomeView()
}
