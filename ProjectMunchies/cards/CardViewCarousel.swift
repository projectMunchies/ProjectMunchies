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
    //defining these allow me to make these args optional
    var profile: ProfileModel = ProfileModel(id: "", fullName: "", location: "", description: "", gender: "",age: "", fcmTokens: [], messageThreadIds: [], occupation: "" , favRestaurant: "", favFood: "", hobbies: [],eventIds: [], isMockData: false, bunchIds: [])
    var groupProfileIds: [String] = []
    
    let cardTypeIndex: Int
    @Binding var detailProfile: ProfileModel?
    @Binding var showDetailView: Bool
    @Binding var currentCardSize: CGSize
    @Binding var detailImage: UIImage
    @Namespace var animation
    
    var body: some View {
        ZStack{
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
                GridViewCardGroup(fitness_Data: GroupImages_Data, cardViewModel2: cardViewModel, groupProfileIds: groupProfileIds)
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
    var fitness_Data: [Fitness]
    var cardViewModel2: CardViewModel
    var groupProfileIds: [String]
    
    var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10){
            ForEach(groupProfileIds, id: \.self) { profileId in
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
//                    Image(uiImage: cardViewModel2.profileImage)
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 100, height: 100)
//                        .cornerRadius(15)
//                        .padding()
//                    //image name same as color name...
//                        .background(.gray)
//                        .cornerRadius(20)
//                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
                
                        IndividualCardsInGroup(profileId: profileId)
                    
                  
                }
            }
        }
        .padding(.horizontal,50)
    }
}

var GroupImages_Data = [
    Fitness(id: 1, title: "sleep", image: "heart", data: "Man these nuggets is cold homie!", suggest: "fasdfsdfasd"),
    
    Fitness(id: 2, title: "sleep", image: "heart", data: "Man these nuggets is cold homie!", suggest: "fasdfsdfasd"),
    Fitness(id: 3, title: "sleep", image: "heart", data: "Man these nuggets is cold homie!", suggest: "fasdfsdfasd"),
    
    Fitness(id: 4, title: "sleep", image: "heart", data: "Man these nuggets is cold homie!", suggest: "fasdfsdfasd"),
    Fitness(id: 5, title: "sleep", image: "heart", data: "Man these nuggets is cold homie!", suggest: "fasdfsdfasd"),
    
    Fitness(id: 6, title: "sleep", image: "heart", data: "Man these nuggets is cold homie!", suggest: "fasdfsdfasd"),
]
