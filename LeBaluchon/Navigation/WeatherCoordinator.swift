//
//  WeatherCoordinator.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 22.01.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

final class WeatherCoordinator {
    
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
        showWeather()
    }

    private func showWeather() {
         let viewController = screens.createWeatherViewController()
         presenter.viewControllers = [viewController]
     }
}
