//
//  VenueView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 6/6/24.
//

import SwiftUI
import CoreLocation

struct VenueView: View {
    @EnvironmentObject var locationManager: LocationManager
    @Binding var sheetIndent: Set<PresentationDetent>
    @Binding var activeTab: NavBarTabsModel
    var place: CLPlacemark?
    
    var body: some View {
        // MARK: Displaying data
        if let place = locationManager.pickedPlaceMark{
            VStack(spacing: 15){
                Text("Confirm Location")
                    .font(.title2.bold())
                    .foregroundColor(.black)
                
                HStack(spacing: 15){
                    Image(systemName: "mappin.circle.fill")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text(place.name ?? "")
                            .font(.title3.bold())
                            .foregroundColor(.black)
                        
                        Text(place.locality ?? "")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 10)
                
                Button{
                    
                } label: {
                    Text("Confirm Location")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical,12)
                        .background{
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.green)
                            
                        }
                        .overlay(alignment: .trailing){
                            Image(systemName: "arrow.right")
                                .font(.title3)
                                .padding(.trailing)
                        }
                        .foregroundColor(.white)
                }
            }
            .padding()
            .background{
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(.white)
                    .ignoresSafeArea()
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

#Preview {
    VenueView(sheetIndent: .constant([.height(60),.medium, .large]), activeTab: .constant(.profile))
}
