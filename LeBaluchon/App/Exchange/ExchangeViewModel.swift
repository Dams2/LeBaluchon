//
//  ExchangeViewModel.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 11.12.19.
//  Copyright © 2019 Damien Rojo. All rights reserved.
//

import Foundation

final class ExchangeViewModel {
    
    // MARK: - Private Properties
    
    private let repository: ExchangeRepositoryType
    
    private var ratesResult: [String: Double] = [:]
    
    init(repository: ExchangeRepositoryType) {
        self.repository = repository
    }

    // MARK: - Outputs
    
    var resultText: ((String) -> Void)?
    
    var amountText: ((String) -> Void)?

    var convertText: ((String) -> Void)?

    struct Exchange {
        let currency: String
    }

    // MARK: - Inputs
    
    func viewDidLoad() {
        resultText?("0 $")
        amountText?("Entrez un montant en €")
        convertText?("Convertir")
    }
    
    func didPressConvert(amountText: String) {
        repository.getExchange(for: "USD") { (ExchangeResponse) in
            self.ratesResult = ExchangeResponse.rates
            guard  let ratesResult = self.ratesResult["USD"] else { return }
            
            self.convertion(amountText: amountText, ratesResult: ratesResult)
        }
    }
    
    private func convertion(amountText: String, ratesResult: Double) {
        let result: Double
        guard let amountText = Double(amountText) else { return }
    
        result = amountText * ratesResult
        
        self.resultText?(String(result))
    }
}
