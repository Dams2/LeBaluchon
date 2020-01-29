//
//  MapCoordinator.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 28.01.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

final class MapCoordinator {
    
    // MARK: - Properties
    
     private let presenter: UINavigationController

     private let screens: Screens

     // MARK: - Initializer

     init(presenter: UINavigationController, screens: Screens) {
         self.presenter = presenter
         self.screens = screens
     }
     
     // MARK: - Coodinator

    func start() {
        showMap()
    }

    private func showMap() {
         let viewController = screens.createMapViewController()
         presenter.viewControllers = [viewController]
     }
}
