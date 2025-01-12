//
//  ProjectMunchiesApp.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/27/23.
//

import SwiftUI
import Firebase
import CoreLocation

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
    
    var locationManager: CLLocationManager?
    var notificationCenter: UNUserNotificationCenter?
    
    
    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) ->  UISceneConfiguration {
        FirebaseApp.configure()
        let sceneConfig = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        sceneConfig.delegateClass = SceneDelegate.self
        return sceneConfig
    }
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.locationManager = CLLocationManager()
        self.locationManager!.delegate = self
        
        //get singleton object
        self.notificationCenter = UNUserNotificationCenter.current()
        
        //register as delegate
        notificationCenter?.delegate = self
        
        
        // define what do you need permission to use
        let options: UNAuthorizationOptions = [.alert, .sound]
        
        // request permission
        notificationCenter!.requestAuthorization(options: options) { (granted, error) in
            if !granted {
                print("Permission not granted")
            }
        }
        
        return true
    }
}

extension AppDelegate: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        if region is CLCircularRegion {
            handleEvent(forRegion: region)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        if region is CLCircularRegion {
            handleEvent(forRegion: region)
        }
       
    }
    
    
    func handleEvent(forRegion region: CLRegion!) {
        let content = UNMutableNotificationContent()
        content.title = "Title bitch"
        content.body = "Well-crafted body message"
        content.sound = UNNotificationSound.default
        
        //when the notification will be triggered
        var timeInSeconds: TimeInterval = (60 * 15) //60s * 15 = 15min
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInSeconds, repeats: false)
        
        // same as the region to avoid duplication
        let identifier = region.identifier
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        notificationCenter!.add(request, withCompletionHandler: { (error) in
            if error != nil {
                print("Error adding notification with identifier: \(identifier)")
            }
        })
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(.alert)
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        let identifer =  response.notification.request.identifier
        
        //do stuff
    }
}


@main
struct ProjectMunchiesApp: App {
    @StateObject var viewRouter: ViewRouter
    @StateObject var profilesviewModel: ProfilesViewModel
    
    init() {
        // do I have to do this again??
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
