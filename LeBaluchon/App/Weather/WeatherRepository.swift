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
                                     temperature: 12,
                                     maxtemperature: 20,
                                     mintemperature: 5,
                                     seaLevel: 1,
                                     groundLevel: 355,
                                     pressure: 1,
                                     humidity: 35)
        callback(result)
    }
}
