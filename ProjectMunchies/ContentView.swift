//
//  ContentView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/27/23.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
       // GeometryReader { geoReader in
            VStack{
                switch viewRouter.currentPage {
                case .homePage :
                    TabView {
                        HomeView()
                            .tabItem {
                                Label("", systemImage: "house")
                            }
                        FeedHomeView()
                            .tabItem {
                               // Label("", systemImage: "network")
                                Image("newsFeedIcon")
                                    .renderingMode(.template)
                                    .resizable()
                                    .foregroundColor(.black)
                                    .scaledToFit()
                            }
                        EventsView()
                            .tabItem {
                                Label("", systemImage: "takeoutbag.and.cup.and.straw")
                            }
                        SettingsView()
                            .tabItem {
                                Label("", systemImage: "person")
                            }
                    }
                case .signinPage :
                    SignInView()
                    
                case .signupPage :
                    SignUpView()
                }
            }
       // }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewRouter())
    }
}
