//
//  WeatherViewModelTests.swift
//  LeBaluchonTests
//
//  Created by Damien Rojo on 30.01.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import XCTest
@testable import LeBaluchon

final class WeatherViewModelTests: XCTestCase {
    
    func testGivenWeatherViewModel_WhenViewDidLoad_ThenRepository_IsCorrectlyReturned() {
        let repository = MockWeatherRepository()
        let response = WeatherResponse(coord: Coord(lon: 23.00, lat: 12.03),
                                               weather: [Weather(id: 30,
                                                                 main: "clouds",
                                                                 weatherDescription: "scattered clouds",
                                                                 icon: "03d")],
                                               base: "stations",
                                               main: Main(temp: 21.00,
                                                          feelsLike: 23.00,
                                                          tempMin: 18.00,
                                                          tempMax: 25.00,
                                                          pressure: 1,
                                                          humidity: 70),
                                               visibility: 10000,
                                               wind: Wind(speed: 4.1, deg: 80),
                                               clouds: .init(all: 12),
                                               dt: 1485789600,
                                               sys: Sys(type: 13,
                                                        id: 5128581,
                                                        country: "US",
                                                        sunrise: 1560343627,
                                                        sunset: 1560396563),
                                               timezone: 12,
                                               id: 420006353,
                                               name: "New York",
                                               cod: 100)
        repository.response = response
        let viewModel = WeatherViewModel(repository: repository)
        let expectation = self.expectation(description: "Repository text returned")

        let expectedResult: [WeatherViewModel.VisibleItem] = [WeatherViewModel.VisibleItem(city: "New York",
                                                                                           icon: "03d",
                                                                                           temperatureText: "-252°C",
                                                                                           maxTemperatureText: "Température max: -248°C",
                                                                                           minTemperatureText: "Température min: -255°C",
                                                                                           sunrise: "Lever: 2019-06-12 12:47:07 +0000",
                                                                                           sunset: "Coucher: 1560396563",
                                                                                           pressureText: "Pression: 0 bar",
                                                                                           humidityText: "Humidité: 70%")]

        var counter = 0
        viewModel.items = { items in
            if counter == 0 {
                XCTAssertEqual(items, expectedResult)
                expectation.fulfill()
            }
            
            counter += 1
        }

        viewModel.viewDidLoad()

        waitForExpectations(timeout: 1.0, handler: nil)

    }
}

fileprivate final class MockWeatherRepository: WeatherRepositoryType {

    var response: WeatherResponse!
    
    func getWeather(for city: City, callback: @escaping (WeatherResponse) -> Void) {
        callback(response)
    }
}
