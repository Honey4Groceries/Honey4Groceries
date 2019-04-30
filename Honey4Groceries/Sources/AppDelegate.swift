//
//  AppDelegate.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 11/12/18.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = window {
            let rootVC = WelcomeViewController(view: WelcomeView(frame: window.frame), viewModel: WelcomeViewModel())
            
            let navigationController = UINavigationController(rootViewController: rootVC)
            window.rootViewController = navigationController
        
            window.makeKeyAndVisible()
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }
    func applicationWillEnterForeground(_ application: UIApplication) {
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }

}
