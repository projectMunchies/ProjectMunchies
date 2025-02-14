//
//  ProjectMunchiesApp.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/27/23.
//

import SwiftUI
import Firebase
import CoreLocation

class AppDelegate: NSObject, UIApplicationDelegate {
    var locationManager = LocationManager()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        locationManager.startMonitoringConditions()
        return true
    }
}

@main
struct ProjectMunchiesApp: App {
    @StateObject var viewRouter: ViewRouter
    @StateObject var profilesviewModel: ProfilesViewModel
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {
        FirebaseApp.configure()

        let viewRouter = ViewRouter()
        _viewRouter = StateObject(wrappedValue: viewRouter)
        
        let profilesviewModel = ProfilesViewModel()
        _profilesviewModel = StateObject(wrappedValue: profilesviewModel)
    }
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewRouter)
                .environmentObject(profilesviewModel)
        }
    }
}
