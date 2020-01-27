//
//  Context.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 27.01.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

final class Context {

    public let client: HTTPClient

    init() {
        let engine = HTTPEngine(configuration: .default)
        client = HTTPClient(engine: engine)
    }
}
