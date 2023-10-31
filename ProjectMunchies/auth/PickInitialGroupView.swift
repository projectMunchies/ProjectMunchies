//
//  PickInitialGroupView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 10/27/23.
//

import SwiftUI

struct PickInitialGroupView: View {
    @StateObject private var homeViewModel = HomeViewModel()
    var body: some View {
        GeometryReader{ geoReader in
            ZStack{
                Color.gray
                    .ignoresSafeArea()
                VStack{
                    Text("Pick your 1st group to join!")
                        .bold()
                        .foregroundColor(.black)
                        .font(.largeTitle)
                    
                    ScrollView{
                        ForEach(homeViewModel.groups, id: \.self){group in
                            ZStack{
                                Text("")
                                    .frame(width: geoReader.size.width * 0.9, height: geoReader.size.height * 0.15)
                                    .background(.white)
                                    .cornerRadius(20)
                                    .shadow(radius: 3)
                                
                                HStack{
                                    Image("Movie5")
                                        .resizable()
                                        .frame(width: 70, height: 70)
                                        .cornerRadius(60)
                                    VStack{
                                        Text("\(group.groupProfile.fullName)")
                                            .bold()
                                            .font(.title2)
                                        
                                        Text("Tampa, Fl")
                                            .font(.title3)
                                        
                                        RatingView(rating: .constant(3))
                                    }
                                    
                                }
                                
                            }
                            
                        }
                    }
                    
                    Button{
                        
                    }label: {
                        Text("or create new Group")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width:geoReader.size.width * 0.9, height:geoReader.size.height * 0.08)
                            .background{
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.green)
                                    .cornerRadius(40)
                            }
                    }
                    
                }
                .onAppear{
                    homeViewModel.getUserProfile() {(userProfileId) -> Void in
                        if userProfileId != "" {
                            //get profileImage
                            homeViewModel.getImageStorageFile(profileId: userProfileId)
                            homeViewModel.getGroups(){(groupIds) in
                                if !groupIds.isEmpty{
                                    print("success")
                                }
                            }
                        }
                    }
                }
            }
        }
        

    }
}

struct PickInitialGroupView_Previews: PreviewProvider {
    static var previews: some View {
        PickInitialGroupView()
    }
}
