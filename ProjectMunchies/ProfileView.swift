//
//  ProfileView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/29/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var cardViewModel = CardViewModel()
    let card: ProfileModel
    
    var body: some View {
        GeometryReader { geoReader in
            ZStack{
                Color.white
                    .ignoresSafeArea()
                
                ZStack{
                    Image(uiImage: cardViewModel.profileImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 450, height: geoReader.size.height * 0.7)
                        .cornerRadius(30)
                        .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.2)
                    
                    Text("")
                        .frame(width: 450, height: geoReader.size.height * 0.65)
                        .background(.white)
                        .cornerRadius(80)
                        .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.8)
                    
//                    ZStack{
//                        Text("")
//                            .frame(width: 70, height: geoReader.size.height * 0.08)
//                            .background(.white)
//                            .cornerRadius(20)
//
//
//                        Image(systemName: "ellipsis")
//                            .frame(width: 25, height: 20)
//                            .font(.system(size: 35))
//                            .rotationEffect(.degrees(-90))
//                    }
//                    .position(x:geoReader.size.width * 0.85, y:geoReader.size.height * 0.02)
                
                    VStack{
                        Text("\(card.fullName)")
                            .bold()
                            .font(.system(size: 30))
                            .foregroundColor(.black)
                            .cornerRadius(80)
                        
//                        Text("Fashion Designer")
//                            .font(.system(size: 20))
//                            .foregroundColor(.black)
//                            .cornerRadius(80)
                           // .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.6)
                        
                        Text("\(card.location)")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .cornerRadius(80)
                        
                        Divider()
                            .padding()
                        
                        Text("About")
                            .bold()
                            .font(.system(size: 30))
                            .foregroundColor(.black)
                        
                        Text("\(card.description)")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .opacity(0.7)
                            .padding(.top,2)
                            .padding(.leading)
                            .padding(.trailing)
                    
//                        Button(action: {
//                        }) {
//                            Text("Find Foodmate")
//                                .frame(width: 300, height: 70)
//                                .background(Color.green)
//                                .cornerRadius(40)
//                                .foregroundColor(.white)
//                        }
                    }
                    .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.7)
                }
                .onAppear{
                    cardViewModel.getStorageFile(profileId: card.id)
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(card: mockProfiles[0])
    }
}
