//
//  TranslationViewModelTests.swift
//  LeBaluchonTests
//
//  Created by Damien Rojo on 21.02.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import XCTest
@testable import LeBaluchon

final class TranslationViewModelTests: XCTestCase {
    
    func testGivenTranslationViewModel_WhenViewModel_ThenOriginText_IsCorrectlyReturned() {
        let repository = MockTranslationRepositoryType()
        let delegate = MockTranslationViewControllerDelegate()
        let viewModel = TranslationViewModel(repository: repository, delegate: delegate)
        let expectation = self.expectation(description: "Origin text returned")
        
        viewModel.originText = { text in
            XCTAssertEqual(text, "Français")
            expectation.fulfill()
        }
        
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenTranslationViewModel_WhenViewModel_ThenOriginPlaceholderText_IsCorrectlyReturned() {
        let repository = MockTranslationRepositoryType()
        let delegate = MockTranslationViewControllerDelegate()
        let viewModel = TranslationViewModel(repository: repository, delegate: delegate)
        let expectation = self.expectation(description: "Origin placeholder text returned")
        
        viewModel.originPlaceholderText = { text in
            XCTAssertEqual(text, "Saisissez du text")
            expectation.fulfill()
        }
        
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenTranslationViewModel_WhenViewModel_ThenDestinationText_IsCorrectlyReturned() {
        let repository = MockTranslationRepositoryType()
        let delegate = MockTranslationViewControllerDelegate()
        let viewModel = TranslationViewModel(repository: repository, delegate: delegate)
        let expectation = self.expectation(description: "Destination text returned")
        
        viewModel.destinationText = { text in
            XCTAssertEqual(text, "Anglais")
            expectation.fulfill()
        }
        
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenTranslationViewModel_WhenViewModel_ThenDestinationPlaceholderText_IsCorrectlyReturned() {
        let repository = MockTranslationRepositoryType()
        let delegate = MockTranslationViewControllerDelegate()
        let viewModel = TranslationViewModel(repository: repository, delegate: delegate)
        let expectation = self.expectation(description: "Destination placeholder text returned")
        
        viewModel.destinationPlaceholderText = { text in
            XCTAssertEqual(text, "Traduction")
            expectation.fulfill()
        }
        
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenTranslationViewModel_WhenViewModel_ThenTranslateText_IsCorrectlyReturned() {
        let repository = MockTranslationRepositoryType()
        let delegate = MockTranslationViewControllerDelegate()
        let viewModel = TranslationViewModel(repository: repository, delegate: delegate)
        let expectation = self.expectation(description: "Translate text returned")
        
        viewModel.translateText = { text in
            XCTAssertEqual(text, "TRADUIRE")
            expectation.fulfill()
        }
        
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}



final class MockTranslationRepositoryType: TranslationRepositoryType {
    
    func getTranslation(originText: String, callback: @escaping (String?) -> Void) {

    }
}

final class MockTranslationViewControllerDelegate: TranslationViewControllerDelegate {
    func didPresentAlert(for alert: AlertType) {
        
    }
}
