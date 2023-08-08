//
//  EventsView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/27/23.
//

import SwiftUI

struct EventsView: View {
    @StateObject private var viewModel = CardViewModel()
    @State private var searchText: String = ""
    @State private var events: [EventModel] = MockService.eventsSampleData
    @State private var showHamburgerMenu: Bool = false
    
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
                                ForEach(self.events.filter({searchText.isEmpty ? true: $0.title.contains(searchText)})) { event in
                                    NavigationLink(destination: EventView(event: event, viewModel: viewModel)) {
                                        
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


                                             
                                                  //  Spacer()
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                        .position(x: geoReader.frame(in: .local).midX, y: geoReader.size.height * 0.65)
                    
                    Text("Events")
                        .bold()
                        .foregroundColor(.black)
                        .font(.largeTitle)
                       .position(x:geoReader.size.width * 0.3, y:geoReader.size.height * 0.1)
                    
                    headerSection(for: geoReader)
                        .position(x:geoReader.size.width * 0.5, y:geoReader.size.height * 0.03)
                }
                .disabled(self.showHamburgerMenu ? true : false)
                //.position(x:geoReader.frame(in: .global).midX, y:geoReader.frame(in: .global).midY)
               
            }
            
            //Display HamburgerMenu
            if self.showHamburgerMenu {
                HamburgerMenu(showHamburgerMenu: self.$showHamburgerMenu, geoReader: geoReader)
                    .frame(width: geoReader.size.width/2)
                    .padding(.trailing, geoReader.size.width * 0.5)
            }
      
        }
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
                .frame(width: geoReader.size.width * 0.25)
            
            HStack(spacing: 20){
//                Image(systemName: "magnifyingglass")
//                    .resizable()
//                    .frame(width: 25, height: 25)
//                    .font(.system(size: 35))
//                    .foregroundColor(.black)
                Spacer()
                    .frame(width: 50)
                
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

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
