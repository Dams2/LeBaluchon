//
//  HelperTests.swift
//  LeBaluchonTests
//
//  Created by Damien Rojo on 02.02.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import XCTest
@testable import LeBaluchon

final class HelperTests: XCTestCase {
    
    func testGivenAHelper_WhenConvert_ThenReturnIsNotNil_IsCorrectlyReturned() {
        let helper = Helper()
        let result = helper.convert("12", with: 13)
        
        XCTAssertNotNil(result)
    }
    
    func testGivenAHelper_WhenConvert_ThenReturnIsNil_IsCorrectlyReturned() {
        let helper = Helper()
        let result = helper.convert("j", with: 13)
        
        XCTAssertNil(result)
    }
    
    func testGivenAHelper_WhenPresentAlert_ThenAlert_IsCorrectlyReturned() {
//        let helper = Helper()
//        let delegate: ExchangeViewControllerDelegate?
//        
//        let expectedResult = helper.presentAlert(title: "Attention", message: "Veuillez entrer une valeur", okMessage: "D'accord", cancelMessage: nil)
//        
//        XCTAssertNotNil(expectedResult)
    }
}