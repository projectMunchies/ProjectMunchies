//
//  ContentView2.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 2/24/24.
//

import SwiftUI
import MapKit

struct ContentView2: View {
    @State private var showSheet: Bool = false
    @State private var activeTab: Tab2 = .devices
    var body: some View {
        ZStack(alignment: .bottom){
            if #available(iOS 17, *) {
                Map(initialPosition: .region(.applePark))
            } else {
                Map(coordinateRegion: .constant(.applePark))
            }
            
            TabBar()
                .frame(height: 49)
                .background(.regularMaterial)
        }
        .task {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) {
            VStack(alignment: .leading, spacing: 10, content:  {
                Text(activeTab.rawValue)
                    .font(.title2)
                    .fontWeight(.semibold)
            })
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .presentationDetents([.height(60), .medium, .large])
            .presentationCornerRadius(20)
            .presentationBackground(.regularMaterial)
            .presentationBackgroundInteraction(.enabled(upThrough: .large))
            .interactiveDismissDisabled()
            .bottomMaskForSheet()
        }
    }
    
    
    
    @ViewBuilder
    func TabBar() -> some View {
        HStack(spacing: 0) {
            ForEach(Tab2.allCases, id: \.rawValue) { tab in
                Button(action: {activeTab = tab}, label: {
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




#Preview {
    ContentView2()
}


extension MKCoordinateRegion {
    static var applePark: MKCoordinateRegion {
        let center = CLLocationCoordinate2D(latitude: 37.334606, longitude: -122.009102)
        return .init(center: center, latitudinalMeters: 10000, longitudinalMeters: 10000)
        
    }
}
