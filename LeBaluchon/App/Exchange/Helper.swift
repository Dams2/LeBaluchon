//
//  Helper.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 02.02.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

final class Helper {
    
    /// <#Description#>
    /// - Parameters:
    ///   - amountText: <#amountText description#>
    ///   - ratesResult: <#ratesResult description#>
    func convert(_ amountText: String, with ratesResult: Double) -> String? {
        guard let amountText = Double(amountText) else { return nil }
        let resultText = "\(String(format: "%.2f", amountText * ratesResult)) $"
        return resultText
    }
}
