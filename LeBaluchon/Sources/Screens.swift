//
//  Screens.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 22.01.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

public class Screens {
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: Screens.self))
}

extension Screens {

    func createExchangeViewController() -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "ExchangeViewController") as! ExchangeViewController
        let viewModel = ExchangeViewModel()
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
        let viewModel = WeatherViewModel()
        viewController.viewModel = viewModel
        return viewController
    }
}
