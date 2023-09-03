//
//  HomeViewCarousel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 9/2/23.
//

import SwiftUI

struct HomeViewCarousel: View {
    //Animated View properties
    @State var currentIndex: Int = 0
    @State var currentTab: String = "Films"
    
    //Detail View properties
    @State var detailMovie: Movie?
    @State var showDetailView: Bool = false
    // FOR MATCHED GEOMETRY EFFECT STORING CURRENT CARD SIZE
    @State var currentCardSize: CGSize = .zero
    
    
    
    @StateObject private var homeViewModel = HomeViewModel()
    
    @State private var showAddImagePopover: Bool = false
    @State private var input1: String = ""
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
                    
    //                //Custom Nav Bar
    //                NavBar()
    //
                    SnapCarousel(spacing: 20,trailingSpace: 110, index: $currentIndex, items: movies){movie in
                        
                        GeometryReader{proxy in
                            let size = proxy.size
                            
                            Image(movie.artwork)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: size.width, height: size.height * 0.67)
                                .cornerRadius(15)
                                .matchedGeometryEffect(id: movie.id, in: animation)
                                .onTapGesture {
                                    currentCardSize = size
                                    detailMovie = movie
                                    withAnimation(.easeInOut){
                                        showDetailView = true
                                    }
                                }
                                .draggable(Image(movie.artwork)){
                                    Image(movie.artwork)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: size.width * 0.2, height: size.height * 0.1)
                                      
                                }
                        }
                        
                    }
                    // Since Carousel is Moved The current Card a little bit up
                    //Using padding to avoid the Undercovering the top element
                    .padding(.top,50)
                    
                    VStack{
                        // Custom Indicator
                        CustomIndicator()
                        
                        HStack{
                            Text("Bunches")
                                .font(.title3.bold())
                            
                            Spacer()
                            
//                            Button("See More"){
//                            }
//                            .font(.system(size: 16, weight: .semibold))
                            
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
                                .disabled(true)
                           
                            }
                        }
                    }
                    .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.77)
                  
                    
                }
                .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.6)
                .overlay{
                    if let movie = detailMovie,showDetailView{
                        DetailView(movie: movie, showDetailVew: $showDetailView, detailMovie: $detailMovie, currentCardSize: $currentCardSize, animation: animation)
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
    func CustomIndicator()->some View{
        HStack(spacing: 5){
            ForEach(movies.indices,id: \.self){index in
                
                Circle()
                    .fill(currentIndex == index ? .blue : .gray.opacity(0.5))
                    .frame(width: currentIndex == index ? 10 : 6, height: currentIndex == index ? 10 : 6)
            }
        }
        .animation(.easeInOut, value: currentIndex)
    }
    //Custom Nav Bar
    @ViewBuilder
    func NavBar()->some View{
        HStack(spacing: 0){
            ForEach(["Films","Localities"],id: \.self){tab in
                Button{
                    
                } label:  {
                    Text(tab)
                        .foregroundColor(.white)
                        .padding(.vertical,6)
                        .padding(.horizontal,20)
//                        .background{
//                            if currentTab == tab{
//                                Capsule()
//                                    .fill(.regularMaterial)
//                                    .environment(\.ColorScheme, .dark)
//                                    .matchedGeometryEffect(id: "TAB", in: animation)
//                            }
//                        }
                }
                
            }
        }
        .padding()
    }
    
    // Blurred BG
    @ViewBuilder
    func BGView()->some View{
        GeometryReader{proxy in
            let size = proxy.size
            
            TabView(selection: $currentIndex) {
                ForEach(movies.indices, id: \.self){index in
                    Image(movies[index].artwork)
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
}

struct HomeViewCarousel_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewCarousel()
    }
}

