//
//  EventsView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/27/23.
//

import SwiftUI

struct EventsView: View {
    @State private var searchText: String = ""
    @State private var events: [BunchModel] = [BunchModel(id: "", locationName: "", profileIds: [], reviewThreadId: "")]
    @State private var showHamburgerMenu: Bool = false
    
    //Animated View properties
    @State var currentIndex: Int = 0
    
    var body: some View {
        GeometryReader { geoReader in
            ZStack{
                Color.white
                    .ignoresSafeArea()
                
                BGView()
                ZStack{
                    VStack{
                        SearchBar(searchText: $searchText, startSearch: .constant(false), textFieldName: "Search...", geoReader: geoReader)
                        
                        ScrollView{
                            VStack{
                                ForEach(self.events) { event in
                                    NavigationLink(destination: SignInView()) {

                                        ZStack{
                                            Text("")
                                                .frame(width: 380, height: 200)
                                                .background(.gray)
                                                .cornerRadius(30)

                                            VStack{
                                                HStack{
//                                                    Spacer()
//                                                    Text("\(event.title)")
//                                                        .font(.system(size: 30))
//                                                        .foregroundColor(.white)

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
//                                                    Text("\(event.eventDate, style: .date)")
//                                                        .font(.system(size: 20))
//                                                        .foregroundColor(.white)
//                                                    Spacer()
//                                                        .frame(width: geoReader.size.width * 0.1)
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
                                
                                
                                Text("MATCH WITH FRIENDS TO SET UP EVENTS")
                                    .font(.system(size: geoReader.size.height * 0.03))
                                    .foregroundColor(.gray)
                                    .opacity(0.5)
                                    .position(x: geoReader.frame(in: .local).midX, y: geoReader.size.height * 0.3)
                            }
                        }
                    }
                        .position(x: geoReader.frame(in: .local).midX, y: geoReader.size.height * 0.65)
                        .onAppear{
                        }
                    
                    
                    Text("Events")
                        .bold()
                        .foregroundColor(.black)
                        .font(.largeTitle)
                       .position(x:geoReader.size.width * 0.2, y:geoReader.size.height * 0.1)
                    
//                    Header(showHamburgerMenu: $showHamburgerMenu, isLoading: .constant(false), foodFilter: .constant(MockDataService.foodFilterSampleData), filteredCards: .constant([]), homeViewModel: homeViewModel)
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
            Spacer()
        }
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
