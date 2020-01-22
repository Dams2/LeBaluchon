//
//  MainCoordinator.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 22.01.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

enum ViewControllerItem: Int {
    case exchange = 0
    case translation
    case weather
}

protocol TabBarSourceType {
    var items: [UINavigationController] { get set }
}

extension TabBarSourceType {
    subscript(item: ViewControllerItem) -> UINavigationController {
        get {
            guard !items.isEmpty, item.rawValue < items.count, item.rawValue >= 0 else {
                fatalError("Item does not exists")
            }
            return items[item.rawValue]
        }
    }
}

fileprivate class TabBarSource: TabBarSourceType {
    var items: [UINavigationController] = [
        UINavigationController(nibName: nil, bundle: nil),
        UINavigationController(nibName: nil, bundle: nil),
        UINavigationController(nibName: nil, bundle: nil)
    ]

    init() {
        self[.exchange].tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        self[.translation].tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        self[.weather].tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
    }
}

final class MainCoordinator: NSObject, UITabBarControllerDelegate {

    // MARK: - Properties
    
    private let presenter: UIWindow

    private let tabBarController: UITabBarController

    private let screens: Screens

    private var exchangeCoordinator: ExchangeCoordinator?

    private var translationCoordinator: TranslationCoordinator?
    
    private var weatherCoordinator: WeatherCoordinator?

    private var tabBarSource: TabBarSourceType = TabBarSource()

    // MARK: - Init

    init(presenter: UIWindow) {
        self.presenter = presenter

        screens = Screens()

        tabBarController = UITabBarController(nibName: nil, bundle: nil)
        tabBarController.viewControllers = tabBarSource.items
        tabBarController.selectedViewController = tabBarSource[.exchange]

        super.init()

        tabBarController.delegate = self
    }

    // MARK: - Coordinator

    func start() {
        presenter.rootViewController = tabBarController
        showExchange()
    }

    private func showExchange() {
        exchangeCoordinator = ExchangeCoordinator(presenter: tabBarSource[.exchange], screens: screens)
        exchangeCoordinator?.start()
    }

    private func showTranslation() {
        translationCoordinator = TranslationCoordinator(presenter: tabBarSource[.translation], screens: screens)
        translationCoordinator?.start()
    }
    private func showWeather() {
        weatherCoordinator = WeatherCoordinator(presenter: tabBarSource[.weather], screens: screens)
        weatherCoordinator?.start()
    }
}

extension MainCoordinator {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let index = tabBarController.selectedIndex
        guard index < tabBarSource.items.count, let item = ViewControllerItem(rawValue: index) else {
            fatalError("Selected ViewController Index Out Of range")
        }

        switch item {
        case .exchange:
            showExchange()
        case .translation:
            showTranslation()
        case .weather:
            showWeather()
        }
    }
}
