//
//  TranslationCoordinator.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 22.01.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

final class TranslationCoordinator {
    
    // MARK: - Properties
    
     private let presenter: UINavigationController

     private let screens: Screens
    
    private var translationViewController: UIViewController?


     // MARK: - Initializer

     init(presenter: UINavigationController, screens: Screens) {
         self.presenter = presenter
         self.screens = screens
     }
     
     // MARK: - Coodinator

    func start() {
        showTranslation()
    }

    private func showTranslation() {
        let viewController = screens.createTranslationViewController()
        presenter.viewControllers = [viewController]
     }
}
