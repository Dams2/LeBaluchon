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
            // Gerer l'akerte le texte est vide
            return
        }
        guard let _ = Double(amountText) else {
            delegate?.didPresentAlert(for: .badNumber(alertConfiguration: AlertConfiguration(title: "Attention",
                                                                                             message: "Merci de mettre un nombre",
                                                                                             okMessage: "Ok",
                                                                                             cancelMessage: nil)))
            return
        }
        
        repository.getExchange(for: usd) { (response) in
            guard let ratesResult = response.rates[self.usd] else { return }
            self.convert(amountText, with: ratesResult)
        }
    }
    
    private func convert(_ amountText: String, with ratesResult: Double) {
        guard let amountText = Double(amountText) else { return }
        self.resultText?("\(round(amountText * ratesResult * 100) / 100) $")
    }
}
