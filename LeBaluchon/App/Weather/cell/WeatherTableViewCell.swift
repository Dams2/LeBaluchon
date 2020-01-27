//
//  WeatherTableViewCelll.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 27.01.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

final class WeatherTableViewCell: UITableViewCell {
    
    // MARK: - Outlets

    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var temperatureLabel: UILabel!
        
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    
    @IBOutlet weak var minTemperatureLabel: UILabel!
    
    @IBOutlet weak var sunriseLabel: UILabel!
    
    @IBOutlet weak var sunsetLabel: UILabel!
    
    @IBOutlet weak var pressureLabel: UILabel!
    
    @IBOutlet weak var humidityLabel: UILabel!
    
    // MARK: - Actions
    
    func configure(with weather: WeatherViewModel.VisibleItem) {
        cityLabel.text = weather.city
        iconImageView.image = UIImage(named: weather.icon)
        temperatureLabel.text = weather.temperatureText
        maxTemperatureLabel.text = weather.maxTemperatureText
        minTemperatureLabel.text = weather.minTemperatureText
        sunriseLabel.text = weather.sunrise
        sunsetLabel.text =  weather.sunset
        pressureLabel.text = weather.pressureText
        humidityLabel.text = weather.humidityText
        
    }
    
}
