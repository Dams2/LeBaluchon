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

    private weak var delegate: ExchangeViewControllerDelegate?
    
    private let helper = Helper()

    private let usd = "USD"
    
    init(repository: ExchangeRepositoryType, delegate: ExchangeViewControllerDelegate) {
        self.repository = repository
        self.delegate = delegate
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
        convertText?("CONVERTIR")
    }
    
    func didPressConvert(amountText: String) {
        guard !amountText.isEmpty else {
            helper.presentAlert(title: "Attention", message: "Vous n'avez saisis aucun montant", okMessage: "Ok", cancelMessage: nil)
            return
        }
        guard let _ = Double(amountText) else {
            helper.presentAlert(title: "Attention", message: "Merci d'entrer un nombre", okMessage: "Ok", cancelMessage: nil)
            return
        }
        
        repository.getExchange(for: usd) { (response) in
            guard let ratesResult = response.rates[self.usd] else { return }
            if let resultText = self.helper.convert(amountText, with: ratesResult) {
                self.resultText?(resultText)
            }
        }
    }
}
