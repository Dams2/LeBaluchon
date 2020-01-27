//
//  WeatherRepository.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 22.01.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

protocol WeatherRepositoryType: class {
    func getWeather(for city: City, callback: @escaping (WeatherResponse) -> Void)
}

final class WeatherRepository: WeatherRepositoryType {

    let client: HTTPClient

    private let token = RequestCancellationToken()

    init(client: HTTPClient) {
        self.client = client
    }
    
    func getWeather(for city: City, callback: @escaping (WeatherResponse) -> Void) {
        
        let stringURL = "http://api.openweathermap.org/data/2.5/weather?id=\(city.rawValue)&appid=e238fde9b73c1a93440741f26a7b28b5"
        guard let url = URL(string: stringURL) else { return }
        client.request(type: WeatherResponse.self,
                       requestType: .GET,
                       url: url,
                       cancelledBy: token,
                       completion: { weatherResponse in
                        callback(weatherResponse)
        })
    }
}
