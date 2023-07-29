//
//  ViewRouter.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/29/23.
//

import SwiftUI

class ViewRouter: ObservableObject {
    static let shared = ViewRouter()
    @Published var currentPage: Route = .homePage
    
    init(){
        run()
    }
    
    func run(){
        self.currentPage = .homePage
    }
}

enum Route {
    case homePage
}
