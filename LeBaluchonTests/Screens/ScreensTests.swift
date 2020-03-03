//
//  ScreensTests.swift
//  LeBaluchonTests
//
//  Created by Damien Rojo on 28.02.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import XCTest
@testable import LeBaluchon

final class ScreensTests: XCTestCase {
    
    var screens: Screens! = nil
    
    var context: Context! = nil
    
    override func setUp() {
        context = Context()
        screens = Screens(context: context)
    }
    
    func testThatCreateExchangeViewControllerCorrectly() {
        let viewController = screens.createExchangeViewController(delegate: nil)
        XCTAssertNotNil(viewController)
    }
    
    func testThatCreateWeatherViewControllerCorrectly() {
        let viewController = screens.createWeatherViewController()
        XCTAssertNotNil(viewController)
    }
    
    func testThatCreateTranslationViewControllerCorrectly() {
        let viewController = screens.createTranslationViewController()
        XCTAssertNotNil(viewController)
    }
    
    func testThatCreateMapViewControllerCorrectly() {
        let viewController = screens.createMapViewController()
        XCTAssertNotNil(viewController)
    }
    
    func testThatCreateAlertCorrectly() {
        let alertConfiguration = AlertConfiguration(title: "", message: "", okMessage: "", cancelMessage: nil)
        let alertController = screens.createAlert(with: alertConfiguration)
        XCTAssertNotNil(alertController)
    }
}
