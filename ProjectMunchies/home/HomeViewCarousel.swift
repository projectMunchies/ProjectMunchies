//
//  HomeViewCarousel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 9/2/23.
//

import SwiftUI

struct HomeViewCarousel: View {
    @StateObject private var homeViewModel = HomeViewModel()
    //Animated View properties
    @State var currentIndex: Int = 0
    
    //Detail View properties
    @State var detailMovie: ProfileModel?
    @State var showDetailView: Bool = false
    
    // FOR MATCHED GEOMETRY EFFECT STORING CURRENT CARD SIZE
    @State var currentCardSize: CGSize = .zero
    
    @State private var isLoading: Bool = false
    @State private var showHamburgerMenu: Bool = false
    @State private var filteredCards: [ProfileModel] = []
    
    // Environment Values
    @Namespace var animation
    @Environment (\.colorScheme) var scheme
    
    var body: some View {
        GeometryReader{geoReader in
            ZStack{
                BGView()
                
                Header(showHamburgerMenu: $showHamburgerMenu, isLoading: $isLoading, foodFilter: $homeViewModel.foodFilter, filteredCards: $filteredCards, homeViewModel: homeViewModel)
                
                ZStack{
                    SnapCarousel(spacing: 20,trailingSpace: 110, index: $currentIndex, items: mockProfiles){profile in
                        GeometryReader{proxy in
                            let size = proxy.size
                            
                            ZStack{
                                Image(profile.artwork)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: size.width, height: size.height * 0.67)
                                    .cornerRadius(15)
                                    .matchedGeometryEffect(id: profile.id, in: animation)
                                    .onTapGesture {
                                        currentCardSize = size
                                        detailMovie = profile
                                        withAnimation(.easeInOut){
                                            showDetailView = true
                                        }
                                    }
                                    .draggable(Image(profile.artwork)){
                                        Image(profile.artwork)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: size.width * 0.2, height: size.height * 0.1)
                                    }
                                
                                VStack{
                                    Text("\(profile.fullName)")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    
                                    Text("\(profile.occupation)")
                                        .foregroundColor(.white)
                                    
                                    Text("\(profile.location)")
                                        .foregroundColor(.white)
                                }
                                .position(x:size.width * 0.2, y:size.height * 0.7)
                            }
                        }
                    }
                    // Since Carousel is Moved The current Card a little bit up
                    //Using padding to avoid the Undercovering the top element
                    .padding(.top,50)
                    .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.35)
                    
                    Footer()
                        .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.77)
                }
                .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.6)
                .overlay{
                    if let profile = detailMovie,showDetailView{
                        DetailView(profile: profile, showDetailVew: $showDetailView, detailMovie: $detailMovie, currentCardSize: $currentCardSize, animation: animation)
                    }
                }
            }
            
            //Display HamburgerMenu
            if self.showHamburgerMenu {
                HamburgerMenu(showHamburgerMenu: self.$showHamburgerMenu, geoReader: geoReader)
                    .frame(width: geoReader.size.width/2)
                    .padding(.trailing, geoReader.size.width * 0.5)
            }
        }
    }
    
    //Custom Indicator
    @ViewBuilder
    private func CustomIndicator()->some View{
        HStack(spacing: 5){
            ForEach(mockProfiles.indices,id: \.self){index in
                Circle()
                    .fill(currentIndex == index ? .blue : .gray.opacity(0.5))
                    .frame(width: currentIndex == index ? 10 : 6, height: currentIndex == index ? 10 : 6)
            }
        }
        .animation(.easeInOut, value: currentIndex)
    }
    
    // Blurred BG
    @ViewBuilder
    private func BGView()->some View{
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
    
    //Footer
    private func Footer()->some View{
        VStack{
            CustomIndicator()
            
            HStack{
                Text("Bunches")
                    .font(.title3.bold())
                Spacer()
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 15){
                    ForEach(mockBunches){bunch in
                        VStack{
                            Image(bunch.artwork)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60, height: 80)
                                .background(.gray.opacity(0.2))
                                .cornerRadius(15)
                                .dropDestination(for: Image.self) { items, locations in
                                    return true
                                }
                            
                            Text(bunch.movieTitle)
                                .font(.system(size: 12))
                                .foregroundColor(.black)
                        }
                    }
                    
                    Button{
                        
                    }label: {
                        VStack{
                            Image(systemName: "plus")
                                .frame(width: 60, height: 80)
                                .background(.gray.opacity(0.5))
                                .cornerRadius(15)
                                .dropDestination(for: Image.self) { items, locations in
                                    return true
                                }
                            
                            Text("Add new bunch")
                                .font(.system(size: 12))
                                .foregroundColor(.black)
                        }
                    }
                }
            }
        }
    }
}

struct HomeViewCarousel_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewCarousel()
    }
}

