//
//  Screens.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 22.01.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

public class Screens {

    let context: Context

    let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: Screens.self))

    init(context: Context) {
        self.context = context
    }
}

protocol ExchangeViewControllerDelegate: class {
    func didPresentAlert(for alert: AlertType)
}

extension Screens {
    func createExchangeViewController(delegate: ExchangeViewControllerDelegate?) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "ExchangeViewController") as! ExchangeViewController
        let repository = ExchangeRepository(client: context.client)
        let viewModel = ExchangeViewModel(repository: repository, delegate: delegate)
        viewController.viewModel = viewModel
        return viewController
    }
}

extension Screens {
    func createTranslationViewController() -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "TranslationViewController") as! TranslationViewController
        let repository = TranslationRepository()
        let viewModel = TranslationViewModel(repository: repository)
        viewController.viewModel = viewModel
        return viewController
    }
}

extension Screens {
    func createWeatherViewController() -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "WeatherViewController") as! WeatherViewController
        let repository = WeatherRepository(client: context.client)
        let viewModel = WeatherViewModel(repository: repository)
        viewController.viewModel = viewModel
        return viewController
    }
}

extension Screens {
    func createAlert(with configuration: AlertConfiguration) -> UIAlertController {
        let alertController = UIAlertController()
        alertController.title = configuration.title
        alertController.message = configuration.message
        let action = UIAlertAction(title: configuration.okMessage,
                                   style: .default,
                                   handler: nil)
        alertController.addAction(action)
        return alertController
    }
}
