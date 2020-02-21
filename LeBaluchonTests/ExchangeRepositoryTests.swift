//
//  ExchangeRepositoryTests.swift
//  LeBaluchonTests
//
//  Created by Damien Rojo on 20.02.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import XCTest
@testable import LeBaluchon

final class ExchangeRepositoryTests: XCTestCase {
    
    func testGivenExchangeRepository_WhenGetExchange_IsCorrectlyReturned() {
        let expectedResponse = ExchangeResponse(success: true,
                                        timestamp: 12,
                                        base: "jds",
                                        date: "js",
                                        rates: ["String" : 12.34])
        
        let mockClient = MockHTTPClientType()
        mockClient.result = expectedResponse

        let repository = ExchangeRepository(client: mockClient)
        let expectation = self.expectation(description: "Response Return")
        
        repository.getExchange(for: "USD", callback: { response in
            XCTAssertEqual(response, expectedResponse)
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}

final class MockHTTPClientType: HTTPClientType {

    var result: ExchangeResponse!
    
    func request<T: Codable>(type: T.Type,
                    requestType: RequestType,
                    url: URL,
                    cancelledBy token: RequestCancellationToken,
                    completion: @escaping (T) -> Void) {
        guard let result = result as? T else { return }
        completion(result)
    }
}