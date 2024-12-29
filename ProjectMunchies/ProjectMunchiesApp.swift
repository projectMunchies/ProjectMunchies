//
//  ProjectMunchiesApp.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/27/23.
//

import SwiftUI
import Firebase

class SceneDelegate: NSObject, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectingOptions: UIScene.ConnectionOptions) {
        let contentView = ContentView()
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = Host(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) ->  UISceneConfiguration {
        FirebaseApp.configure()
        let sceneConfig = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        sceneConfig.delegateClass = SceneDelegate.self
        return sceneConfig
    }
}

@main
struct ProjectMunchiesApp: App {
    @StateObject var viewRouter: ViewRouter
    
    init() {
        FirebaseApp.configure()
        
        let viewRouter = ViewRouter()
        _viewRouter = StateObject(wrappedValue: viewRouter)
    }
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewRouter)
        }
    }
}
