//
//  VenueView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 6/6/24.
//

import SwiftUI
import CoreLocation
import AVKit

struct VenueView: View {
    @EnvironmentObject var locationManager: LocationManager
    @Binding var sheetIndent: Set<PresentationDetent>
    @Binding var activeTab: NavBarTabsModel
    @State private var player = AVPlayer(url:  Bundle.main.url(forResource: "exampleMp4", withExtension: "mp4")!)
    
    var body: some View {
        if let place = locationManager.pickedPlaceMark{
            GeometryReader{ geoReader in
                
                VStack(spacing: 10){
                    headerSection(place: place)
                        .multilineTextAlignment(.leading)
                    
                    Divider()
                        .foregroundColor(.white)
                    
                    reviewsView()
                    
                    Divider()
                        .foregroundColor(.white)
                    
                    specialsView()
                }
                .task {
                    sheetIndent = [.height(260), .medium, .large]
                }
                .padding()
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
    }
    
    @ViewBuilder
    private func headerSection(place: CLPlacemark) -> some View {
        VStack{
            HStack{
                ForEach(0..<2){ _ in
                    venueTabsView()
                }
            }
            .padding(.bottom, 30)
            
            VideoPlayer(player: player)
                .frame(height: 100)
                .cornerRadius(10)
                .onAppear {
                                         player.seek(to: .zero)
                                         player.play()
                }
                .onDisappear {
                    player.pause()
                }
            
            Text(locationManager.venueTitle)
                .font(.system(size: 20))
                .foregroundColor(.white)
            
            Text(place.name ?? "")
                .font(.system(size: 10))
                .foregroundColor(.white)
        }
    }
    
    @ViewBuilder
    private func reviewsView() -> some View {
        VStack{
            HStack{
                if (locationManager.venueAlertType == "reviews") {
                    Text("New")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
                
                Text("Reviews")
                    .font(.title2)
                    .foregroundColor(.gray)
                
                if (locationManager.venueAlertType == "reviews") {
                    Image(systemName: "mappin.circle.fill")
                        .font(.title2)
                        .foregroundColor(.red)
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 10)
            
            ScrollView(.horizontal) {
                LazyHStack{
                    ForEach(0..<6) {_ in
                        Button {
                            
                        } label: {
                            ZStack{
                                Text("")
                                    .frame(width: 200, height: 100)
                                    .background(.gray)
                                    .cornerRadius(20)
                                VStack{
                                    Text("John Doe")
                                        .bold()
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                    
                                    Text("these damn nuggets have been dry for a a month. Im out this bee")
                                        .font(.system(size: 12))
                                        .foregroundColor(.white)
                                }
                                .frame(width: 200, height: 100)
                            }
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private func specialsView() -> some View {
        VStack(alignment: .leading){
            
            HStack{
                if (locationManager.venueAlertType == "specials") {
                    Text("New")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
                
                
                Text("Specials")
                    .font(.title2)
                    .foregroundColor(.gray)
                
                if (locationManager.venueAlertType == "specials") {
                    Image(systemName: "mappin.circle.fill")
                        .font(.title2)
                        .foregroundColor(.yellow)
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 10)
            
            
            ScrollView(.horizontal) {
                LazyHStack{
                    ForEach(0..<6) {_ in
                        Button {
                            
                        } label: {
                            ZStack{
                                Text("")
                                    .frame(width: 200, height: 100)
                                    .background(.gray)
                                    .cornerRadius(20)
                                VStack{
                                    Text("2 for 1 deal")
                                        .bold()
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                    
                                    Text("$12 idk what the hell this is")
                                        .font(.system(size: 12))
                                        .foregroundColor(.white)
                                }
                                .frame(width: 200, height: 100)
                                
                            }
                        }
                        
                    }
                }
            }
        }
    }
    
}

#Preview {
    HomeView()
}
