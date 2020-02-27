//
//  TranslationRepository.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 12.02.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation
import SwiftGoogleTranslate

protocol TranslationRepositoryType: class {
    func getTranslation(originText: String, callback: @escaping (String?) -> Void)
}
protocol SwiftGoogleTranslateType: class {
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
        swiftGoogleTranslate.start(with: "AIzaSyC5G9jKEyehau2iR0MfAe1WD6_a3cqNHEI")
    }

    func getTranslation(originText: String, callback: @escaping (String?) -> Void) {
//        swiftGoogleTranslate.translate(originText, "en", "fr") { (text, error) in
//            guard let text = text else { return }
//            print(text)
//            callback(text)
//        }
        swiftGoogleTranslate.translate(originText,
                                       "en",
                                       "fr",
                                       "text",
                                       "base") { text, error in
                                        print(text)
        }
    }
}
