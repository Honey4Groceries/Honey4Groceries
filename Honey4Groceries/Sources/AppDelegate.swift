//
//  AppDelegate.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 11/12/18.
//

import UIKit
import Firebase
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let homeViewController = LoginViewController()
        window!.rootViewController = homeViewController
        window!.makeKeyAndVisible()
        Store.searchStores(5000, CLLocation(latitude: 32.8801, longitude: -117.2340))
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
