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
    
//    func testGivenWeatherViewModel_WhenViewDidLoad_ThenRepository_IsCorrectlyReturned() {
//        let repository = MockWeatherRepository()
//        let viewModel = WeatherViewModel(repository: repository)
//        let expectation = self.expectation(description: "Repository text returned")
//
//        var counter = 0
//        viewModel.items = { items in
//            if counter == 1 {
//                repository.getWeather(for: .newYork) { (response) in
//                    viewModel.weatherItems.append(.city(conditions: response))
//                }
//                XCTAssertEqual(items, )
//                expectation.fulfill()
//            }
//            counter += 1
//        }
//
//        viewModel.viewDidLoad()
//        waitForExpectations(timeout: 1.0, handler: nil)
//
//    }
}

fileprivate final class MockWeatherRepository: WeatherRepositoryType {
    
    func getWeather(for city: City, callback: @escaping (WeatherResponse) -> Void) {
    }
}
