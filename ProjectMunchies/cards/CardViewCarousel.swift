//
//  CardViewCarousel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 9/8/23.
//

import SwiftUI

struct CardViewCarousel: View {
    @StateObject private var cardViewModel = CardViewModel()
    let size: CGSize
    let profile: ProfileModel
    @Binding var detailMovie: ProfileModel?
    @Binding var showDetailView: Bool
    @Binding var currentCardSize: CGSize
    @Binding var detailImage: UIImage
    
    @Namespace var animation
    var body: some View {
        ZStack{
            Image(uiImage: cardViewModel.profileImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height * 0.67)
                .cornerRadius(15)
            //contentShape fixed the issue with onTapGesture not clicking the right image
                .contentShape(Rectangle())
                .matchedGeometryEffect(id: profile.id, in: animation)
                .onTapGesture {
                    currentCardSize = size
                    detailMovie = profile
                    detailImage = cardViewModel.profileImage
                    withAnimation(.easeInOut){
                        showDetailView = true
                    }
                }
                .draggable(Image(uiImage: cardViewModel.profileImage)){
                    Image(uiImage: cardViewModel.profileImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width * 0.2, height: size.height * 0.1)
                }
            
            VStack{
                Text("\(profile.fullName)")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.leading)
                
                Text("\(profile.occupation)")
                    .foregroundColor(.white)
                    .padding(.leading)
                
                Text("\(profile.location)")
                    .foregroundColor(.white)
                    .padding(.leading)
            }
            .position(x:size.width * 0.2, y:size.height * 0.7)
        }
        .onAppear{
            cardViewModel.getStorageFile(profileId: profile.id)
        }
    }
}

struct CardViewCarousel_Previews: PreviewProvider {
    static var previews: some View {
        CardViewCarousel(size: .zero, profile: mockProfiles.first!, detailMovie: .constant(mockProfiles.first!), showDetailView: .constant(false), currentCardSize: .constant(.zero), detailImage: .constant(UIImage()))
    }
}
