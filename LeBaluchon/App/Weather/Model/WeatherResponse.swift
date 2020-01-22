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
    let temperatureText: String
    let maxTemperatureText: String
    let minTemperatureText: String
    let seaLevelText: String
    let groundLevelText: String
    let pressureText: String
    let humidityText: String
}
