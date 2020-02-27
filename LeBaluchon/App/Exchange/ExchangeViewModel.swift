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
    
    init(repository: ExchangeRepositoryType,
         delegate: ExchangeViewControllerDelegate?) {
        self.repository = repository
        self.delegate = delegate
    }

    // MARK: - Outputs
    
    var resultText: ((String) -> Void)?
    
    var amountText: ((String) -> Void)?

    var convertText: ((String) -> Void)?
    
    var alertDisplay: ((AlertType) -> Void)?

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
            presentAlert(title: "Attention", message: "Merci d'entrer une valeur", okMessage: "Ok", cancelMessage: nil)
            return
        }
        guard let _ = Double(amountText) else {
            presentAlert(title: "Attention", message: "Merci d'entrer un nombre", okMessage: "Ok", cancelMessage: nil)
            return
        }
        
        repository.getExchange(for: usd) { rate in
            if let resultText = self.helper.convert(amountText, with: rate) {
                self.resultText?(resultText)
            }
        }
    }
    
    private func presentAlert(title: String, message: String, okMessage: String, cancelMessage: String?) {
        delegate?.didPresentAlert(for: .badEntry(alertConfiguration: AlertConfiguration(title: title,
                                                                                        message: message,
                                                                                        okMessage: okMessage,
                                                                                        cancelMessage: cancelMessage)))
    }

}
