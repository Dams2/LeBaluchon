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
    
    func didPressConvert() {
        repository.getExchange(for: "USD") { (ExchangeResponse) in
            self.resultText?(String(ExchangeResponse.timestamp))
        }
    }
}
