//
//  Coordinator.swift
//  Metaweather
//
//  Created by Bassuni on 18/06/2021.
//


import UIKit

protocol Coordinator : class  {
    var navigationController: UINavigationController { get }
    var childCoordinators: [Coordinator] { get set }
    func start()
}

extension Coordinator {
    
    func addCoordinator(coordinator : Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func removeCoordinator(coordinator : Coordinator) {
        childCoordinators =  childCoordinators.filter({$0 !== coordinator})
    }
}

