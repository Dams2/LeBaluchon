//
//  WeatherResponse.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 22.01.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

struct WeatherResponse: Codable {
    let city: String
    let icon: String 
    let temperatureText: Double
    let maxTemperatureText: Double
    let minTemperatureText: Double
    let seaLevelText: Double
    let groundLevelText: Double
    let pressureText: Double
    let humidityText: Double
}
