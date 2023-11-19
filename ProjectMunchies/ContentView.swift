//
//  ContentView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/27/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var selectedTab = 0
      
      var body: some View {
          GeometryReader{ geoReader in
              ZStack(alignment: .bottom){
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
                  .background(.purple.opacity(0.2))
                  .cornerRadius(35)
                  .padding(.horizontal, 26)
              }
          }
          .ignoresSafeArea(.keyboard, edges: .bottom)
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
