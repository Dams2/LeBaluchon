//
//  ExchangeViewModel.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 11.12.19.
//  Copyright © 2019 Damien Rojo. All rights reserved.
//

import Foundation

final class ExchangeViewModel {
    
    // MARK: - Outputs
    
    var resultText: ((String) -> Void)?
    
    var amountText: ((String) -> Void)?

    var convertText: ((String) -> Void)?
    
    var currency: (([Exchange]) -> Void)?
    
    struct Exchange {
        let usd: String
    }
    
    enum WeatherItems {
        case usd(rates: ExchangeResponse)
    }

    // MARK: - Inputs
    
    func viewDidLoad() {
        resultText?("0 $")
        amountText?("Entrez un montant en €")
        convertText?("Convertir")
    }
    
    func didPressConvert() {
        
    }
}
