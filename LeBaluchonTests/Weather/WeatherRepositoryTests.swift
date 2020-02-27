//
//  WeatherRepositoryTests.swift
//  LeBaluchonTests
//
//  Created by Damien Rojo on 21.02.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import XCTest
@testable import LeBaluchon

final class WeatherRepositoryTests: XCTestCase {
    
    func testGivenWeatherRepository_WhenGetWeather_ThenCallback_IsCorrectlyReturned() {
        let expectedResponse = WeatherResponse(coord: Coord(lon: 23.00, lat: 12.03),
                                               weather: [Weather(id: 30,
                                                                 main: "clouds",
                                                                 weatherDescription: "scattered clouds",
                                                                 icon: "03d")],
                                               base: "stations",
                                               main: Main(temp: 21.00,
                                                          feelsLike: 23.00, tempMin: 18.00,
                                                          tempMax: 25.00, pressure: 1,
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

        let mockClient = MockWeatherHTTPClientMock()
        mockClient.result = expectedResponse
        
        let repository = WeatherRepository(client: mockClient)
        let expectation = self.expectation(description: "Callback Return")
        
        repository.getWeather(for: .newYork, callback: { weather in
            XCTAssertEqual(weather, expectedResponse)
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}

final class MockWeatherHTTPClientMock: HTTPClientType {
    
    var result: WeatherResponse!
    
    func request<T: Codable>(type: T.Type,
                    requestType: RequestType,
                    url: URL,
                    cancelledBy token: RequestCancellationToken,
                    completion: @escaping (T) -> Void) {
        guard let result = result as? T else { return }
        completion(result)
    }
}
