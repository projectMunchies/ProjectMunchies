//
//  CreateGroupView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 10/21/23.
//

import SwiftUI

struct CreateGroupView: View {
    @StateObject private var viewModel = CardViewModel()
    @StateObject private var homeViewModel = HomeViewModel()
    @State private var searchText: String = ""
    @State private var events: [BunchModel] = []
    @State private var showHamburgerMenu: Bool = false
    @State var currentIndex: Int = 0
    @State private var title: String = ""
    
    var body: some View {
        GeometryReader { geoReader in
            ZStack{
                Color.white
                    .ignoresSafeArea()
                
                BGView()
                ZStack{
                    VStack{
                            TextField("Group Name", text: $title)
                            .font(.system(size: 40))
                                .frame(width: 300, height: 50)
                                .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                .background(.white.opacity(0.1))
                                .foregroundColor(.black)
                                .cornerRadius(20)
                                .padding(.bottom,40)
                        
                        SearchBar(searchText: $searchText, startSearch: .constant(false), textFieldName: "Search user or add email")
                            .padding(.bottom)
                         
                        ScrollView{
                            VStack{
                                HStack{
//                                    Circle()
//                                        .frame(width: 80, height: 80)
                                    
                                    Image("Movie3")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(60)
                                      
                                    
                                    Spacer()
                                        .frame(width: 20)
                                    
                                    VStack{
                                        Text("Zara")
                                            .font(.title2)
                                        Spacer()
                                            .frame(height: 10)
                                        Text("Tampa,Fl")
                                            .font(.system(size: 15))
                                    }
                                    
                                    Spacer()
                                        .frame(width: 170)
                                    
                                    Image(systemName: "plus.circle.fill")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.blue)
                                  
                                }
                            }
                        }
                        
                        Button{
                            
                        }label: {
                            Text("Create New Group")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width:geoReader.size.width * 0.9, height:geoReader.size.height * 0.1)
                                .background{
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(.gray)
                                        .cornerRadius(40)
                                }
                        }
                        .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.1)
                        
        
                  
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
                    
                    Text("Create Group")
                        .bold()
                        .foregroundColor(.black)
                        .font(.largeTitle)
                       .position(x:geoReader.size.width * 0.25, y:geoReader.size.height * 0.1)
                    
                    Header(showHamburgerMenu: $showHamburgerMenu, isLoading: .constant(false), foodFilter: .constant(MockDataService.foodFilterSampleData), filteredCards: .constant([]), homeViewModel: homeViewModel)
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
    
    // Blurred BG
    @ViewBuilder
    func BGView()->some View{
        GeometryReader{proxy in
            let size = proxy.size
            
            TabView(selection: $currentIndex) {
                ForEach(mockProfiles.indices, id: \.self){index in
                    Image(mockProfiles[index].artwork)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                        .clipped()
                        .tag(index)
                    
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.easeInOut, value: currentIndex)
            
            let color: Color = .white
            //Custom Gradient
            LinearGradient(colors: [
                .white,
                .clear,
                color

            ], startPoint: .top, endPoint: .bottom)
            
            // Blurred Overlay
            Rectangle()
                .fill(.ultraThinMaterial)
        }
        .ignoresSafeArea()
    }
    
    private func headerSection(for geoReader: GeometryProxy) -> some View {
        HStack{
            Spacer()
            HStack(spacing: 10){
                Button(action: {
                    self.showHamburgerMenu.toggle()
                }) {
                    Image(systemName: "line.3.horizontal")
                        .resizable()
                        .frame(width: 25, height: 20)
                        .font(.system(size: 35))
                        .foregroundColor(.black)
                }
                Text("CrunchBunch")
                    .bold()
                    .foregroundColor(.black)
                    .font(.title2)
            }
            
            Spacer()
                .frame(width: geoReader.size.width * 0.3)
            
            HStack(spacing: 20){
                    NavigationLink(destination: NotificationsView() ) {
                        Image("filterIcon")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .font(.system(size: 35))
                            .foregroundColor(.black)
                    }
            
                NavigationLink(destination: NotificationsView() ) {
                    Image(systemName: "bell")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .font(.system(size: 35))
                        .foregroundColor(.black)
                }
            }
            Spacer()
        }
    }
}

struct CreateGroupView_Previews: PreviewProvider {
    static var previews: some View {
        CreateGroupView()
    }
}
