//
//  ContentView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/27/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var selectedTab = 0
    @State private var showFilter: Bool = false
    
      var body: some View {
          GeometryReader{ geoReader in
              ZStack{
                  TabView(selection: $selectedTab) {
                      HomeView()
                          .tag(0)
                      VideoPlayerHomeView(showOverlay: false)
                          .tag(1)
                      EventsView()
                          .tag(2)
                      EventsView()
                          .tag(3)
                  }
                  //map and TabView() arent working together nicely so I gotta increase height. They also fuck up every other screen
                  .frame(height: geoReader.size.height * 1.2)
                
                  ZStack{
                      HStack{
                          ForEach((TabbedItems.allCases), id: \.self){ item in
                              Button{
                                  selectedTab = item.rawValue
                              } label: {
                                  CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                              }
                              if item.rawValue == 1  {
                                  Spacer()
                                      .frame(width: 100)
                              }
                          }
                      }
                      .padding(6)
                  }
                  .frame(height: 70)
                  .background(.indigo.opacity(0.6))
                  .cornerRadius(35)
                  .padding(.horizontal, 26)
                  .position(x: geoReader.frame(in: .local).midX, y: geoReader.size.height * 0.97)
                  
                  if selectedTab == 0 {
                      Button(action: {
                          self.showFilter.toggle()
                      }) {
                          ZStack{
                              Text("")
                                  .frame(width: 65, height: 65)
                                  .background(.white.opacity(0.9))
                                  .cornerRadius(40)
                              
                              Image("crunchBunchAppIcon")
                                  .resizable()
                                  .frame(width: 40, height: 40)
                          }
                      }
                     // .disabled(self.startSearch ? true : false)
                      .position(x: geoReader.frame(in: .local).midX, y: geoReader.size.height * 0.93)
                  }
              }
          }
      }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewRouter())
    }
}

enum TabbedItems: Int, CaseIterable{
    case home = 0
    case events
    case chat
    case profile
    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .events:
            return "Events"
        case .chat:
            return "Chat"
        case .profile:
            return "Profile"
        }
    }
    
    var iconName: String{
        switch self {
        case .home:
            return "homeIcon"
        case .events:
            return "playerIcon"
        case .chat:
            return "filterIcon"
        case .profile:
            return "filterIcon"
        }
    }
}
