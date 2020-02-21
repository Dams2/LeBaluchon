//
//  TranslationRepository.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 12.02.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation
import SwiftGoogleTranslate

protocol TranslationRepositoryType {
    func getTranslation(originText: String, callback: @escaping (String) -> Void)
}
protocol SwiftGoogleTranslateType {
    func start(with apiKey: String)
    func translate(_ q: String,
                   _ target: String,
                   _ source: String,
                   _ format: String,
                   _ model: String,
                   _ completion: @escaping ((String?, Error?) -> Void))
}

extension SwiftGoogleTranslate: SwiftGoogleTranslateType {}

final class TranslationRepository: TranslationRepositoryType{
    
    let swiftGoogleTranslate: SwiftGoogleTranslateType
     
    init(swiftGoogleTranslate: SwiftGoogleTranslateType = SwiftGoogleTranslate.shared) {
        self.swiftGoogleTranslate = swiftGoogleTranslate
        self.swiftGoogleTranslate.start(with: "61ed32bee4a4592eb79ab4e80bf71f7974d3e5cb")
    }

    func getTranslation(originText: String, callback: @escaping (String) -> Void) {
        swiftGoogleTranslate.translate(originText, "fr", "en", "", "") { (text, error) in
            guard let text = text else { return }
            print(text)
            callback(text)
        }
    }
}


