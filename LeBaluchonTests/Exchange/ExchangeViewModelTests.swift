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
    
    func testGivenExchangeViewModel_WhenDidPressConvertWithEmptyAmountText_ThenAlertIsCorrectlyReturned() {
        let delegate = MockExchangeViewControllerDelegate()
        let viewModel = ExchangeViewModel(repository: MockExchangeRepository(),
                                          delegate: delegate)
        
        viewModel.didPressConvert(amountText: "")
        
        XCTAssertEqual(delegate.alert, AlertType.badEntry(alertConfiguration: AlertConfiguration(title:  "Attention", message: "Merci d'entrer une valeur", okMessage: "Ok", cancelMessage: nil)))
    }
    
    func testGivenExchangeViewModel_WhenDeisPressConvertWithStringAmountText_ThenAlertIsCorrectlyReturned() {
        let delegate = MockExchangeViewControllerDelegate()
        let viewModel = ExchangeViewModel(repository: MockExchangeRepository(), delegate: delegate)
        
        viewModel.didPressConvert(amountText: "J")
        
        XCTAssertEqual(delegate.alert, AlertType.badEntry(alertConfiguration: AlertConfiguration(title: "Attention", message: "Merci d'entrer un nombre", okMessage: "Ok", cancelMessage: nil)))
    }

    func testGivenExchangeViewModel_WhenDidPressConvert_ThenResultText_IsCorrectlyReturned() {
        let repository = MockExchangeRepository()
        repository.result = 1.23396
        let delegate = MockExchangeViewControllerDelegate()
        let viewModel = ExchangeViewModel(repository: repository, delegate: delegate)
        let expectation = self.expectation(description: "Response returned")
        
        var counter = 0
        
        viewModel.resultText = { result in
            if counter == 1 {
                XCTAssertEqual(result, "16.04 $")
                expectation.fulfill()
            }
            counter += 1
        }
        
        viewModel.viewDidLoad()
        
        viewModel.didPressConvert(amountText: "13")
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}

fileprivate final class MockExchangeRepository: ExchangeRepositoryType {

    var result: Double!

    func getExchange(for currency: String,
                     callback: @escaping (Double) -> Void) {
        callback(result)
    }
}

fileprivate final class MockExchangeViewControllerDelegate: ExchangeViewControllerDelegate {

    var alert: AlertType? = nil
    
    func didPresentAlert(for alert: AlertType) {
        self.alert = alert
    }
}
