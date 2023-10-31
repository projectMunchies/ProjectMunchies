//
//  GroupProfileView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 10/30/23.
//

import SwiftUI

struct GroupProfileView: View {
    var body: some View {
        GeometryReader{geoReader in
            ZStack{
                Color.white
                    .ignoresSafeArea()
                VStack{
                    Image("Movie4")
                        .resizable()
                        .scaledToFill()
                        //.frame(width: geoReader.size.width, height: geoReader.size.height * 0.5)
                        .ignoresSafeArea()
                    
                    VStack{
                        Text("5 Pac")
                            .bold()
                            .font(.title)
                    }
                    
                    VStack{
                        Text("Members")
                            .font(.title2)
                        ScrollView{
                            ForEach(0..<4){item in
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
                                            Text("Full Name")
                                                .bold()
                                                .font(.title2)
                                            
                                            Text("Location")
                                                .font(.title3)
                                        }
                                        
                                    }
                              
                                }
                            
                            }
                        }
                    }
                    
                    Button(action: {
                       
                    }) {
                        Text("Join Group")
                            .frame(width: geoReader.size.width * 0.8, height: geoReader.size.height * 0.08)
                            .background(Color.gray)
                            .cornerRadius(geoReader.size.width * 0.06)
                            .foregroundColor(.white)
                    }
                    
                    
                }
                
            }
        }
    }
}

struct GroupProfileView_Previews: PreviewProvider {
    static var previews: some View {
        GroupProfileView()
    }
}
