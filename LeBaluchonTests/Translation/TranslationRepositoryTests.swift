//
//  TranslationRepositoryTests.swift
//  LeBaluchonTests
//
//  Created by Damien Rojo on 02.02.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import XCTest
@testable import LeBaluchon

final class TranslationRepositoryTests: XCTestCase {
    
    func testGivenTranslationRepository_WhenGetTranslation_IsCorrectlyReturned() {
        let swiftGoogleTranslate = MockSwiftGoogleTranslateType()
        let translationRepository = TranslationRepository(swiftGoogleTranslate: swiftGoogleTranslate)
        let expectation = self.expectation(description: "Return Text")
        
        translationRepository.getTranslation(originText: "salut", callback: { text in
            
            XCTAssertEqual(text, "hello")
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}

final class MockSwiftGoogleTranslateType: SwiftGoogleTranslateType {

    var translatedText: String = "hello"
    
    func start(with apiKey: String) {
        
    }
    
    func translate(_ q: String,
                   _ target: String,
                   _ source: String,
                   _ format: String,
                   _ model: String,
                   _ completion: @escaping ((String?, Error?) -> Void)) {
        completion(self.translatedText, nil)
    }
}
