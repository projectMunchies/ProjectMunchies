//
//  ProjectMunchiesApp.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/27/23.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct ProjectMunchiesApp: App {
    init() {
        FirebaseApp.configure()
    }
    @StateObject var viewRouter = ViewRouter()
    var body: some Scene {
        WindowGroup {
                ContentView().environmentObject(viewRouter)
        }
    }
}
