//
//  LiveFeed.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 8/19/23.
//

import SwiftUI

struct LiveFeedView: View {
    @State private var showHamburgerMenu: Bool = false
    @StateObject private var homeViewModel = HomeViewModel()
    @State private var searchText: String = ""
    @State private var feed: [EventModel] = []
    
    var body: some View {
        GeometryReader { geoReader in
            ZStack{
                Color.white
                    .ignoresSafeArea()
                
                ZStack{
                    VStack{
                        SearchBar(searchText: $searchText)
                        
                        ScrollView{
                            VStack{
                                ForEach(self.feed.filter({searchText.isEmpty ? true: $0.title.contains(searchText)})) { event in
                                        ZStack{
                                            Text("")
                                                .frame(width: 380, height: 200)
                                                .background(.gray)
                                                .cornerRadius(30)

                                            VStack{
                                                HStack{
                                                    Spacer()
                                                    Text("\(event.title)")
                                                        .font(.system(size: 30))
                                                        .foregroundColor(.white)

                                                    Spacer()

//                                                    Image(systemName: "ellipsis")
//                                                        .resizable()
//                                                        .scaledToFill()
//                                                        .frame(width: 10, height: 5)
//                                                        .font(.system(size: 35))
//                                                        .foregroundColor(.white)
                                                   // Spacer()
                                                }

                                                Spacer()
                                                    .frame(height: 50)
                                                HStack{
                                                  //  Spacer()
                                                    Text("\(event.eventDate, style: .date)")
                                                        .font(.system(size: 20))
                                                        .foregroundColor(.white)
                                                    Spacer()
                                                        .frame(width: geoReader.size.width * 0.1)
//
//                                                    ForEach(event.participants, id: \.self) { participant in
//                                                        ZStack{
//                                                            Image("Guy")
//                                                                .resizable()
//                                                                .scaledToFill()
//                                                                .frame(width: 50, height: 50)
//                                                                .cornerRadius(20)
//                                                                .foregroundColor(.white)
//
//                                                        }
//
//                                                    }

                                                    Image("Guy")
                                                                .resizable()
                                                                .scaledToFill()
                                                                .frame(width: 50, height: 50)
                                                                .cornerRadius(20)
                                                                .foregroundColor(.white)

                                                    Image("Girl")
                                                                .resizable()
                                                                .scaledToFill()
                                                                .frame(width: 50, height: 50)
                                                                .cornerRadius(20)
                                                                .foregroundColor(.white)
                                                }
                                            }
                                        }
                                    }
                            }
                        }
                    }
                        .position(x: geoReader.frame(in: .local).midX, y: geoReader.size.height * 0.65)
                        .onAppear{
                            homeViewModel.getUserProfile() {(userProfileId) -> Void in
                                if userProfileId != "" {
                                    //get profileImage
                                    homeViewModel.getImageStorageFile(profileId: userProfileId)
                                }
                            }
                        }
                    
                    
                    Text("CrunchFeed")
                        .bold()
                        .foregroundColor(.black)
                        .font(.largeTitle)
                       .position(x:geoReader.size.width * 0.25, y:geoReader.size.height * 0.1)
                    
                    Header(showHamburgerMenu: $showHamburgerMenu, isLoading: .constant(false), foodFilter: .constant(MockService.foodFilterSampleData), filteredCards: .constant([]), homeViewModel: homeViewModel)
                }
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

struct LiveFeedView_Previews: PreviewProvider {
    static var previews: some View {
        LiveFeedView()
    }
}
