//
//  LiveFeed.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 8/19/23.
//

import SwiftUI

struct LiveFeed: View {
    @State private var showHamburgerMenu: Bool = false
    @StateObject private var homeViewModel = HomeViewModel()
    
    var body: some View {
        GeometryReader{ geoReader in
            ZStack{
                Color.white
                    .ignoresSafeArea()
                
                ZStack{
                    VStack{
                        HStack{
                            ForEach((1...4), id: \.self) { _ in
                                Circle()
                                    .frame(width: 75, height: 75)
                                    .foregroundColor(.gray)
                            }
                        }
                        .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.6)
                        
                        ScrollView{
                            ForEach((1...6), id: \.self) { item in
                                ZStack{
                                    Text("")
                                        .frame(width: 380, height: 100)
                                        .background(.gray)
                                        .cornerRadius(30)
                                }
                            }
                         
                        }
                        .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.4)
                      
                       
                    }
                   // .position(x: geoReader.frame(in: .local).midX, y: geoReader.size.height * 0.65)
                    
                    Text("Chipotle Live")
                        .bold()
                        .foregroundColor(.black)
                        .font(.system(size: geoReader.size.height * 0.1))
                       .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.3)
                    
                    Header(showHamburgerMenu: $showHamburgerMenu, isLoading: .constant(false), foodFilter: .constant(MockService.foodFilterSampleData), filteredCards: .constant([]), homeViewModel: homeViewModel)
                }
                .position(x: geoReader.frame(in: .local).midX , y: geoReader.frame(in: .local).midY)
                .disabled(self.showHamburgerMenu ? true : false)
        }
            
            //Display HamburgerMenu
            if self.showHamburgerMenu {
                HamburgerMenu(showHamburgerMenu: self.$showHamburgerMenu, geoReader: geoReader)
                    .frame(width: geoReader.size.width/2)
                    .padding(.trailing, geoReader.size.width * 0.5)
            }
       
        }
    }
}

struct LiveFeed_Previews: PreviewProvider {
    static var previews: some View {
        LiveFeed()
    }
}
