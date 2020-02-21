//
//  TranslationViewModel.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 11.12.19.
//  Copyright © 2019 Damien Rojo. All rights reserved.
//

import Foundation

final class TranslationViewModel {
    
    // MARK: - Private Properties
    
    private let repository: TranslationRepositoryType
    
    init(repository: TranslationRepositoryType) {
        self.repository = repository
    }

    // MARK: - Outputs
    
    var originText: ((String) -> Void)?
    
    var originPlaceholderText: ((String) -> Void)?
    
    var destinationText: ((String) -> Void)?
    
    var destinationPlaceholderText: ((String) -> Void)?
    
    var translateText: ((String) -> Void)?

    // MARK: - Inputs
    
    func viewDidLoad() {
        originText?("Français")
        originPlaceholderText?("Saisissez du text")
        destinationText?("Anglais")
        destinationPlaceholderText?("Traduction")
        translateText?("TRADUIRE")
    }
    
    func didPressTranslation(text: String) {
//        repository.getTranslation(originText: text, callback: )
    }
}
