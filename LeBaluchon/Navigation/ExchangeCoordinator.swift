//
//  ExchangeCoordinator.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 22.01.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

final class ExchangeCoordinator {
    
    // MARK: - Properties
    
    private let presenter: UINavigationController
    
    private let screens: Screens

    private var exchangeViewController: UIViewController?
    
    // MARK: - Initializer
    
    init(presenter: UINavigationController, screens: Screens) {
        self.presenter = presenter
        self.screens = screens
    }
    
    // MARK: - Coodinator
    
    func start() {
        showExchange()
    }
    
    private func showExchange() {
        exchangeViewController = screens.createExchangeViewController(delegate: self)
        guard let exchangeViewController = exchangeViewController else { return }
        presenter.viewControllers = [exchangeViewController]
    }
}

extension ExchangeCoordinator: ExchangeViewControllerDelegate {
    func didPresentAlert(for alert: AlertType) {
        switch alert {
        case .badNumber(alertConfiguration: let configuration):
            let alertController = screens.createAlert(with: configuration)
            exchangeViewController?.present(alertController,
                                            animated: true)
        }
    }
}

struct AlertConfiguration {
    let title: String
    let message: String
    let okMessage: String
    let cancelMessage: String?
}
