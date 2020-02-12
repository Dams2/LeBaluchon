//
//  TranslationViewModelTests.swift
//  LeBaluchonTests
//
//  Created by Damien Rojo on 02.02.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import XCTest
@testable import LeBaluchon

final class TranslationViewModelTests: XCTestCase {
    
    func testGivenTranslationViewModel_WhenViewDidLoad_ThenOriginText_IsCorrectlyReturned() {
        let viewModel = TranslationViewModel()
        let expectation = self.expectation(description: "Origin text returned")

        viewModel.originText = { text in
            XCTAssertEqual(text, "Français")
            expectation.fulfill()
        }

        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenTranslationViewModel_WhenViewDidLoad_ThenOriginPlaceholderText_IsCorrectlyReturned() {
        let viewModel = TranslationViewModel()
        let expectation = self.expectation(description: "Origin placeholder text returned")

        viewModel.originPlaceholderText = { text in
            XCTAssertEqual(text, "Saisissez du text")
            expectation.fulfill()
        }

        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenTranslationViewModel_WhenViewDidLoad_ThenDestinationText_IsCorrectlyReturned() {
        let viewModel = TranslationViewModel()
        let expectation = self.expectation(description: "Destination text returned")

        viewModel.destinationText = { text in
            XCTAssertEqual(text, "Anglais")
            expectation.fulfill()
        }

        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenTranslationViewModel_WhenViewDidLoad_ThenDestinationPlaceholderText_IsCorrectlyReturned() {
        let viewModel = TranslationViewModel()
        let expectation = self.expectation(description: "Destination placeholder text returned")

        viewModel.destinationPlaceholderText = { text in
            XCTAssertEqual(text, "Traduction")
            expectation.fulfill()
        }

        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenTranslationViewModel_WhenViewDidLoad_ThenTranslateText_IsCorrectlyReturned() {
        let viewModel = TranslationViewModel()
        let expectation = self.expectation(description: "Translate text returned")

        viewModel.translateText = { text in
            XCTAssertEqual(text, "TRADUIRE")
            expectation.fulfill()
        }

        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}
