//
//  RequestCancellationToken.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 22.01.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

final class RequestCancellationToken {

    init() {}

    deinit {
        willDealocate?()
    }

    var willDealocate: (() -> Void)?
}
