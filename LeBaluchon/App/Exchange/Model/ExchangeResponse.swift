//
//  ExchangeResponse.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 28.01.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

// MARK: - ExchangeResponse
struct ExchangeResponse: Codable {
    let success: Bool
    let timestamp: Int
    let base, date: String
    let rates: [String: Double]
}

extension ExchangeResponse: Equatable {}
