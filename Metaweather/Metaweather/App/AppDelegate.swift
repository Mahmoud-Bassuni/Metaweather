//
//  AppDelegate.swift
//  Metaweather
//
//  Created by Bassuni on 18/06/2021.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
   var appCoordinator: AppCoordinator?
   var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
        let navController = UINavigationController()
        window = UIWindow(frame: UIScreen.main.bounds)
        appCoordinator = AppCoordinator(window: window, navigationController: navController)
        appCoordinator?.start()

        return true
    }
}
