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
        VStack{
            switch viewRouter.currentPage {
            case .homePage :
                TabView {
                    HomeViewCarousel()
                        .tabItem {
                            Label("", systemImage: "house")
                        }
                    CreateGroupView()
                        .tabItem {
                            Label("", systemImage: "plus.circle.fill")
                        }
                    EventsView()
                        .tabItem {
                            Label("", systemImage: "calendar")
                        }
            
//                    FeedHomeView()
//                        .tabItem {
//                            Image("newsFeedIcon")
//                                .renderingMode(.template)
//                                .resizable()
//                                .foregroundColor(.black)
//                                .scaledToFit()
//                        }
                }
            case .signinPage :
                SignInView()
                
            case .signupPage :
                SignUpView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewRouter())
    }
}
