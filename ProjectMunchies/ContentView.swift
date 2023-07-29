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
        GeometryReader { geoReader in
            switch viewRouter.currentPage {
            case .homePage :
                TabView {
                    HomeView()
                        .tabItem {
                            Label("", systemImage: "house")
                        }
                    CardsView()
                        .tabItem {
                            Label("", systemImage: "takeoutbag.and.cup.and.straw")
                        }
                    CardsView()
                        .tabItem {
                            Label("", systemImage: "person")
                        }
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
