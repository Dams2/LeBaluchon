//
//  VisibleWeather+WeatherResponse.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 22.01.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

extension VisibleWeather {
    init(response: WeatherResponse) {
        self.city = response.city
        self.icon = response.icon
        self.temperatureText = "\(response.temperatureText)"
        self.maxTemperatureText = "\(response.maxTemperatureText)"
        self.minTemperatureText = "\(response.minTemperatureText)"
        self.seaLevelText = "\(response.seaLevelText)"
        self.groundLevelText = "\(response.groundLevelText)"
        self.pressureText = "\(response.pressureText)"
        self.humidityText = "\(response.humidityText)"
    }
}
