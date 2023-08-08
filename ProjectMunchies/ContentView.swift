//
//  ContentView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/27/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
            switch viewRouter.currentPage {
            case .homePage :
                TabView {
                    HomeView()
                        .tabItem {
                            Label("", systemImage: "house")
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewRouter())
    }
}
