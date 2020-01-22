//
//  Coordinator.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 22.01.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

final class Coordinator {
    
    private unowned var sceneDelegate: SceneDelegate

    private var mainCoordinator: MainCoordinator?

    // MARK: - Initializer

   init(sceneDelegate: SceneDelegate) {
       self.sceneDelegate = sceneDelegate
   }

   // MARK: - Coordinator

    func start() {
        if ProcessInfo.processInfo.environment["IS_RUNNING_UNIT_TESTS"] == "YES" {
            return
        }

       showMain()
   }

    private func showMain() {
        mainCoordinator = MainCoordinator(presenter: sceneDelegate.window!)
        mainCoordinator?.start()
    }
}
