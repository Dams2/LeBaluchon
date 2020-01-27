//
//  WeatherRepository.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 22.01.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

protocol WeatherRepositoryType: class {
    func getWeather(for city: String, callback: @escaping (WeatherResponse) -> Void)
}

final class WeatherRepository: WeatherRepositoryType {
    func getWeather(for city: String, callback: @escaping (WeatherResponse) -> Void) {
        let result = WeatherResponse(city: "New York",
                                     icon: "n1",
                                     temperatureText: 12,
                                     maxTemperatureText: 20,
                                     minTemperatureText: 5,
                                     seaLevelText: 1,
                                     groundLevelText: 355,
                                     pressureText: 1,
                                     humidityText: 35)
        callback(result)
    }
}
