//
//  WeatherViewModel.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 11.12.19.
//  Copyright © 2019 Damien Rojo. All rights reserved.
//

import Foundation

final class WeatherViewModel {
    
    // MARK: - Private Properties
    
    private let repository = WeatherRepositoryType
    
    init(repository: WeatherRepositoryType) {
        self.repository = repository
    }
    
    var weatherItems: [WeatherItems] = [] {
        didSet {
            let items = weatherItems.map { VisibleItem{weatherItems: $0 }
                self.items?(items)
            }
        }
    }
    
    // MARK: - Outputs
    
    var items: (([VisibleItem]) -> Void)?
    
    struct VisibleItem: Equatable {
        let city: String
        let icon: String
        let temperatureText: String
        let maxTemperatureText: String
        let minTemperatureText: String
        let seaLevelText: String
        let groundLevelText: String
        let pressureText: String
        let humidityText: String
    }
    
    enum WeatherItems {
        case city(conditions: WeatherResponse)
    }
    
    // MARK: - Inputs
    
    func viewDidLoad() {
        repository.getWeather(for: "New York") { (response) in
            self.weatherItems.append(.city(conditions: response))
            self.repository.getWeather(for: "Geneva") { (response) in
                self.weatherItems.append(.city(conditions: response))
            }
        }
    }
    
    func didPressCity() {
        
    }
}

extension WeatherViewModel.VisibleItem {
    init(weatherItems: WeatherViewModel.WeatherItems) {
        switch weatherItems {
        case .city(conditions: let response):
            self = WeatherViewModel.VisibleItem(response: response)
        }
    }
}
