//
//  Helper.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 02.02.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation


final class Helper {
    
    private weak var delegate: ExchangeViewControllerDelegate?

    func convert(_ amountText: String, with ratesResult: Double) -> String? {
        guard let amountText = Double(amountText) else { return nil }
        let resultText = "\(round(amountText * ratesResult * 100) / 100) $"
        return resultText
    }
    
    func presentAlert(title: String, message: String, okMessage: String, cancelMessage: String?) {
        delegate?.didPresentAlert(for: .badEntry(alertConfiguration: AlertConfiguration(title: title,
                                                                                        message: message,
                                                                                        okMessage: okMessage,
                                                                                        cancelMessage: cancelMessage)))
    }
}
