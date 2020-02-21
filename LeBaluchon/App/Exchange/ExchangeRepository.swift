//
//  ExchangeRepository.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 28.01.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

protocol ExchangeRepositoryType: class {
    func getExchange(for currency: String, callback: @escaping (ExchangeResponse) -> Void)
}

protocol HTTPClientType: class {
    func request<T>(type: T.Type,
                    requestType: RequestType,
                    url: URL,
                    cancelledBy token: RequestCancellationToken,
                    completion: @escaping (T) -> Void) where T : Decodable, T : Encodable
}

extension HTTPClient: HTTPClientType {}

final class ExchangeRepository: ExchangeRepositoryType {
    
    let client: HTTPClientType

    private let token = RequestCancellationToken()

    init(client: HTTPClientType) {
        self.client = client
    }
    
    func getExchange(for currency: String, callback: @escaping (ExchangeResponse) -> Void) {
        
        let stringURL = "http://data.fixer.io/api/latest?access_key=e87b7aaf13a4b6950601ce3cde2612d0&symbols=\(currency)&format=1"
        guard let url = URL(string: stringURL) else { return }
        client.request(type: ExchangeResponse.self,
                       requestType: .GET,
                       url: url,
                       cancelledBy: token,
                       completion: { exchangeResponse in
                        callback(exchangeResponse)
        })

    }
}
