//
//  TranslationRepository.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 12.02.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation
import SwiftGoogleTranslate

class A {
    let u = SwiftGoogleTranslate()
    
    func toto() {
        u.start(with: "APIKEY")
        
    }

    func getMachin() {
        u.translate(<#T##q: String##String#>, <#T##target: String##String#>, <#T##source: String##String#>, <#T##format: String##String#>, <#T##model: String##String#>, <#T##completion: ((String?, Error?) -> Void)##((String?, Error?) -> Void)##(String?, Error?) -> Void#>)
    }
}
