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
    
    let slidingTabsIndex: Int
    @Binding var detailProfile: ProfileModel?
    @Binding var showDetailView: Bool
    @Binding var currentCardSize: CGSize
    @Binding var detailImages: [UIImage]
    @Namespace var animation
    
    var body: some View {
            ZStack{
                //Singles = 1, Groups = 0
                if slidingTabsIndex == 1 {
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
                            detailImages = [cardViewModel.profileImage]
                            withAnimation(.easeInOut){
                                showDetailView = true
                            }
                        }
//                        .draggable(Image(uiImage: cardViewModel.profileImage)){
//                            Image(uiImage: cardViewModel.profileImage)
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width: size.width * 0.2, height: size.height * 0.1)
//                        }
                } else {
                    GridViewCardGroup(cardViewModelMultipleImages: cardViewModel, groupProfileIds: groupProfileIds, size: size)
                        .onTapGesture {
                            currentCardSize = size
                            detailProfile = profile
                            detailImages = cardViewModel.profileImages
                            withAnimation(.easeInOut){
                                showDetailView = true
                            }
                        }
//                        .draggable(Image(uiImage: cardViewModel.profileImage)){
//                            Image(uiImage: cardViewModel.profileImage)
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width: size.width * 0.2, height: size.height * 0.1)
//                        }
                }
                
                VStack{
                    if slidingTabsIndex == 1 {
                        Text("\(profile.fullName)")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.leading)
                            .position(x:size.width * 0.2, y:size.height * 0.8)
                    } else {
                        Text("\(profile.fullName)")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            //.padding(.trailing)
                            .position(x:size.width * 0.5, y:size.height * 0.68)
                    }
                 
                    
                    Text("\(profile.occupation)")
                        .foregroundColor(.white)
                        .padding(.leading)
                        .position(x:size.width * 0.2, y:size.height * 0.7)
                    
                    Text("\(profile.location)")
                        .foregroundColor(.white)
                        .padding(.leading)
                        .position(x:size.width * 0.2, y:size.height * 0.7)
                }
              
            }
            .onAppear{
                cardViewModel.getStorageFile(profileId: groupProfileIds[0])
            }
    }
}

struct CardViewCarousel_Previews: PreviewProvider {
    static var previews: some View {
        CardViewCarousel(size: .zero, profile: mockProfiles.first!, slidingTabsIndex: 0, detailProfile: .constant(mockProfiles.first!), showDetailView: .constant(true), currentCardSize: .constant(.zero), detailImages: .constant([]))
    }
}

struct GridViewCardGroup: View {
    var cardViewModelMultipleImages: CardViewModel
    var groupProfileIds: [String]
    var columns = Array(repeating: GridItem(.flexible()), count: 2)
    let size: CGSize
    
    var body: some View {
        LazyVGrid(columns: columns, alignment: .center){
            ForEach(groupProfileIds.indices, id: \.self) { index in
                if index < 5 {
                    IndividualCardsInGroup(profileId: groupProfileIds[index], size: size, cardViewModelMultipleImages: cardViewModelMultipleImages)
                }else if index == 5 {
                    ZStack{
                        Text("")
                            .frame(width: size.height * 0.2, height: size.height * 0.2)
                            .background(.gray)
                            .cornerRadius(20)
                        
                        Text("+\(groupProfileIds.count - 5)")
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                }
            }
        }
        .padding(5)
    }
}
