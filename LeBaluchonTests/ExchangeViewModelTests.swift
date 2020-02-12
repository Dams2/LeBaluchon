//
//  ExchangeViewModelTests.swift
//  LeBaluchonTests
//
//  Created by Damien Rojo on 30.01.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import XCTest
@testable import LeBaluchon

final class ExchangeViewModelTests: XCTestCase {
    
    func testGivenExchangeViewModel_WhenViewDidLoad_ThenResultText_IsCorrectlyReturned() {
        let repository = MockExchangeRepository()
        let delegate = MockExchangeViewControllerDelegate()
        let viewModel = ExchangeViewModel(repository: repository, delegate: delegate)
        let expectation = self.expectation(description: "Result text returned")

        viewModel.resultText = { text in
            XCTAssertEqual(text, "0 $")
            expectation.fulfill()
        }

        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenExchangeViewModel_WhenViewDidLoad_ThenAmountText_IsCorrectlyReturned() {
        let repository = MockExchangeRepository()
        let delegate = MockExchangeViewControllerDelegate()
        let viewModel = ExchangeViewModel(repository: repository, delegate: delegate)
        let expectation = self.expectation(description: "Amount text returned")

        viewModel.amountText = { text in
            XCTAssertEqual(text, "Entrez un montant en €")
            expectation.fulfill()
        }

        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenExchangeViewModel_WhenViewDidLoad_ThenConvertText_IsCorrectlyReturned() {
        let repository = MockExchangeRepository()
        let delegate = MockExchangeViewControllerDelegate()
        let viewModel = ExchangeViewModel(repository: repository, delegate: delegate)
        let expectation = self.expectation(description: "Convert text returned")

        viewModel.convertText = { text in
            XCTAssertEqual(text, "CONVERTIR")
            expectation.fulfill()
        }

        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
//    func testGivenExchangeViewModel_WhenDidPressConvert_ThenRepository_IsCorrectlyReturned() {
//        let repository = MockExchangeRepository()
//        let delegate = MockExchangeViewControllerDelegate()
//        let viewModel = ExchangeViewModel(repository: repository, delegate: delegate)
//        let expectation = self.expectation(description: "Repository returned")
//
//        viewModel.didPressConvert(amountText: "10")
//
//        viewModel.viewDidLoad()
//        viewModel.didPressConvert(amountText: "10")
//        waitForExpectations(timeout: 1.0, handler: nil)
//    }
    
    func testGivenExchangeViewModel_WhenDidPressConvert_ThenAmountTextIsEmpty_IsCorrectlyReturned() {
        let repository = MockExchangeRepository()
        let delegate = MockExchangeViewControllerDelegate()
        let viewModel = ExchangeViewModel(repository: repository, delegate: delegate)
        let helper = Helper()
        
        
        let expectation = self.expectation(description: "Repository returned")
        
        helper.presentAlert(title: "Attention", message: "Vous n'avez saisis aucun montant", okMessage: "Ok", cancelMessage: nil)
        
        expectation.fulfill()
        
        viewModel.viewDidLoad()
        viewModel.didPressConvert(amountText: "")
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}

fileprivate final class MockExchangeRepository: ExchangeRepositoryType {
    
    var response: ExchangeResponse!

    func getExchange(for currency: String, callback: @escaping (ExchangeResponse) -> Void) {
        callback(response)
    }
}

fileprivate final class MockExchangeViewControllerDelegate: ExchangeViewControllerDelegate {
    
    func didPresentAlert(for alert: AlertType) {
        
    }
}
