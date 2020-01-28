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

extension Screens {

    func createExchangeViewController() -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "ExchangeViewController") as! ExchangeViewController
        let repository = ExchangeRepository(client: context.client)
        let viewModel = ExchangeViewModel(repository: repository)
        viewController.viewModel = viewModel
        return viewController
    }
}

extension Screens {

    func createTranslationViewController() -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "TranslationViewController") as! TranslationViewController
        let viewModel = TranslationViewModel()
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
