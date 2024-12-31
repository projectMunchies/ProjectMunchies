//
//  HomeView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 12/27/24.
//

import SwiftUI

struct HomeView: View {
    @Binding var sheetIndents: Set<PresentationDetent>
    @Binding var settingsDetent: PresentationDetent
    @State private var isEditProfile = false
    
    var body: some View {
        VStack(spacing: 10){
            ProfileView(sheetIndents: $sheetIndents, settingsDetent: $settingsDetent, isEditProfile: $isEditProfile)

            HStack{
                ZStack{
                    Circle()
                        .frame(width: 40, height: 40)
                        .background(Color.gray)
                        .foregroundColor(.red)
                        .cornerRadius(50)
                    
                    Text("1")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                    
                }
                
                Text("Review alert")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
            .opacity(isEditProfile ? 0.3 : 1)
            
            HStack{
                ZStack{
                    Circle()
                        .frame(width: 40, height: 40)
                        .background(Color.gray)
                        .foregroundColor(.yellow)
                        .cornerRadius(50)
                    
                    Text("3")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                    
                }
                
                Text("Special alert")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
            .opacity(isEditProfile ? 0.3 : 1)
        }
    }
}

#Preview {
    HomeView(sheetIndents: .constant([.height(60),.medium, .large]),settingsDetent: .constant(.height(60)))
}
