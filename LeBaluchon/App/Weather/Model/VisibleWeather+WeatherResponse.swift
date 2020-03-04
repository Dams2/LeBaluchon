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
        self.temperatureText = "\(Int(response.main.temp - 273))°C"
        self.maxTemperatureText = "Température max: \(Int(response.main.tempMax - 273.15))°C"
        self.minTemperatureText = "Température min: \(Int(response.main.tempMin - 273.15))°C"
        self.sunrise = "Lever: \(DateFormatter.hourMinutesFormat(date: TimeInterval(response.sys.sunrise)))"
        self.sunset = "Coucher: \(DateFormatter.hourMinutesFormat(date: TimeInterval(response.sys.sunset)))"
        self.pressureText = "Pression: \(response.main.pressure / 1000) bar"
        self.humidityText = "Humidité: \(response.main.humidity)%"
    }
}
