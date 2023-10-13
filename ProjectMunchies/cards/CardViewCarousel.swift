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
    //defining this allow me to make this arg optional
    var groupProfileIds: [String] = []
    
    let cardTypeIndex: Int
    @Binding var detailProfile: ProfileModel?
    @Binding var showDetailView: Bool
    @Binding var currentCardSize: CGSize
    @Binding var detailImage: UIImage
    @Namespace var animation
    
    var body: some View {
        ZStack{
            //Singles = 1, Groups = 0
            if cardTypeIndex == 1 {
                Image(uiImage: cardViewModel.profileImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height * 0.55)
                    .cornerRadius(15)
                //contentShape fixed the issue with onTapGesture not clicking the right image
                    .contentShape(Rectangle())
                    .matchedGeometryEffect(id: profile.id, in: animation)
                    .onTapGesture {
                        currentCardSize = size
                        detailProfile = profile
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
            } else {
                GridViewCardGroup(cardViewModel2: cardViewModel, groupProfileIds: groupProfileIds)
                    .onTapGesture {
                        currentCardSize = size
                        detailProfile = profile
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
        CardViewCarousel(size: .zero, profile: mockProfiles.first!, cardTypeIndex: 0, detailProfile: .constant(mockProfiles.first!), showDetailView: .constant(false), currentCardSize: .constant(.zero), detailImage: .constant(UIImage()))
    }
}

struct GridViewCardGroup: View {
    var cardViewModel2: CardViewModel
    var groupProfileIds: [String]
    var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10){
            ForEach(groupProfileIds, id: \.self) { profileId in
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                    IndividualCardsInGroup(profileId: profileId)
                }
            }
        }
        .padding(.horizontal,50)
    }
}
