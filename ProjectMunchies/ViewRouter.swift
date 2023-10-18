//
//  ViewRouter.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/29/23.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class ViewRouter: ObservableObject {
    static let shared = ViewRouter()
    @Published var currentPage: Route = .homePage
    
    init(){
        run()
    }
    
    func run(){
        Auth.auth().addStateDidChangeListener{ auth, user in
            if auth.currentUser != nil {
                self.currentPage = .homePage
            }
        }
    }
}

enum Route {
    case homePage
    case signinPage
    case signupPage
}
