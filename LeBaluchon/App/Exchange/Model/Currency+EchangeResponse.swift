//
//  Currency+EchangeResponse.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 28.01.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

extension ExchangeViewModel.Exchange {
    init(response: ExchangeResponse) {
        self.currency = "\(response.rates)"
    }
}
