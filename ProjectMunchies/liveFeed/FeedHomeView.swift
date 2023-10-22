//
//  LiveFeed.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 8/19/23.
//

import SwiftUI
import MapKit

struct FeedHomeView: View {
    @State private var showHamburgerMenu: Bool = false
    @StateObject private var homeViewModel = HomeViewModel()
    //Animated View properties
    @State var currentIndex: Int = 0
    @State var index: Int = 0
    
    var body: some View {
        GeometryReader { geoReader in
            ZStack{
                Color.white
                    .ignoresSafeArea()
                
                BGView()
                
                ZStack{
                    VStack{
                        //Tab View...
                        HStack(spacing: 0){
                            Text("Latest")
                                .foregroundColor(self.index == 0 ? .white : Color(.blue).opacity(0.7))
                                .fontWeight(.bold)
                                .padding(.vertical,10)
                                .padding(.horizontal,35)
                                .background(Color(.blue).opacity(self.index == 0 ? 1 : 0))
                                .clipShape(Capsule())
                                .onTapGesture {
                                    withAnimation(.default){
                                        self.index = 0
                                    }
                                    
                                }
                            Spacer(minLength: 0)
                            
                            Text("Popular")
                                .foregroundColor(self.index == 1 ? .white : Color(.blue).opacity(0.7))
                                .fontWeight(.bold)
                                .padding(.vertical,10)
                                .padding(.horizontal,35)
                                .background(Color(.blue).opacity(self.index == 1 ? 1 : 0))
                                .clipShape(Capsule())
                                .onTapGesture {
                                    withAnimation(.default){
                                        self.index = 1
                                    }
                                }
                            
                            Spacer(minLength: 0)
                            
                            Text("New")
                                .foregroundColor(self.index == 2 ? .white : Color(.blue).opacity(0.7))
                                .fontWeight(.bold)
                                .padding(.vertical,10)
                                .padding(.horizontal,35)
                                .background(Color(.blue).opacity(self.index == 2 ? 1 : 0))
                                .clipShape(Capsule())
                                .onTapGesture {
                                    withAnimation(.default){
                                        self.index = 2
                                    }
                                }
                        }
                        .background(Color.black.opacity(0.06))
                        .clipShape(Capsule())
                        .padding(.horizontal)
                        .padding(.top,25)
                        
                        //Dashbord grid...
                        
                        //Tab view with swipe gestures...
                        
                        TabView(selection: self.$index){
                            GridView(fitness_Data: fit_Data)
                                .tag(0)
                            
                            GridView(fitness_Data: week_fit_Data)
                                .tag(1)
                            
                            VStack{
                                Text("Monthly Data")
                            }
                            .tag(2)
                            
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        
                        
                        Spacer(minLength: 0)
                    }
                    .position(x: geoReader.frame(in: .local).midX, y: geoReader.size.height * 0.61)
                    
                    
                    Text("FeedHome")
                        .bold()
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .position(x:geoReader.size.width * 0.2, y:geoReader.size.height * 0.1)
                    
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
        .ignoresSafeArea(.keyboard, edges: .bottom)
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
}

struct FeedHomeView_Previews: PreviewProvider {
    static var previews: some View {
        // GeometryReader{ proxy in
        FeedHomeView()
        //  }
        
    }
}

// Grid View...

struct GridView: View {
    var fitness_Data : [Fitness]
    var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 1)
    
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 30){
            ForEach(fitness_Data) { fitness in
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                    
                    VStack(alignment: .leading, spacing: 15){
                        Text(fitness.title)
                            .foregroundColor(.white)
                        
                        Text(fitness.data)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top,10)
                        
                        HStack{
                            Spacer(minLength: 0)
                            
                            Text(fitness.suggest)
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    //image name same as color name...
                    .background(.gray)
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
                    
                    //top Image...
                    
                    Image("Bunch2")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .padding()
                        .background(.white.opacity(0.35))
                        //.clipShape(Circle())
                        .cornerRadius(20)
                }
            }
        }
        .padding(.horizontal)
        .padding(.top,25)
    }
}


// Dashboard grid model...

struct Fitness: Identifiable {
    var id: Int
    var title: String
    var image: String
    var data: String
    var suggest: String
}

var fit_Data = [
    Fitness(id: 0, title: "McDonalds @ Kennedy ", image: "heart", data: "Man these nuggets is cold homie!", suggest: "1 hour ago"),
    
    Fitness(id: 1, title: "sleep", image: "heart", data: "234 bpm", suggest: "fasdfsdfasd")
]

var week_fit_Data = [
    Fitness(id: 0, title: "heart rate", image: "heart", data: "234 bpm", suggest: "fasdfsdfasd")
]
