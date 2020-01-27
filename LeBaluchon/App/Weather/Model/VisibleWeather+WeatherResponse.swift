//
//  VisibleWeather+WeatherResponse.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 22.01.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

extension WeatherViewModel.VisibleItem {
    init(response: WeatherResponse) {
        self.city = response.name
        self.icon = response.weather.first?.icon ?? "01d"
        self.temperatureText = "\(response.main.temp)"
        self.maxTemperatureText = "\(response.main.tempMax)"
        self.minTemperatureText = "\(response.main.tempMin)"
        self.seaLevelText = ""
        self.groundLevelText = ""
        self.pressureText = ""
        self.humidityText = ""
    }
}
