//
//  AppCoordinator.swift
//  Metaweather
//
//  Created by Bassuni on 18/06/2021.
//

import UIKit

class AppCoordinator : Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    let window : UIWindow?
   
    init(window: UIWindow? , navigationController: UINavigationController) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() {
        // preparing root view
        let myCoordinator = CityCoordinator(navigationController: navigationController)
        addCoordinator(coordinator: myCoordinator)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
          myCoordinator.start()
        
    }
    
}

