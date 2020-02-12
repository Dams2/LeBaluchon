//
//  TranslationViewController.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 22.01.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

final class TranslationViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var originLabel: UILabel!
    
    @IBOutlet weak var originTextView: UITextView! {
        didSet {
            originTextView.layer.borderWidth = 0.5
            originTextView.layer.cornerRadius = 15
            originTextView.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
    @IBOutlet weak var destinationLabel: UILabel!
    
    @IBOutlet weak var destinationTextView: UITextView! {
        didSet {
            destinationTextView.layer.borderWidth = 0.5
            destinationTextView.layer.cornerRadius = 15
            destinationTextView.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
    @IBOutlet weak var translateButton: UIButton!
    
    // MARK: - Properties
    
    weak var coordinator: TranslationCoordinator?

    var viewModel = TranslationViewModel()
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind(to: viewModel)
        viewModel.viewDidLoad()
        
    }

    // MARK: - Helpers
    
    private func bind(to viewModel: TranslationViewModel) {
        viewModel.originText = { [weak self] text in
            self?.originLabel.text = text
        }
        
        viewModel.originPlaceholderText = { [weak self] placeholder in
            self?.originTextView.text = placeholder
        }
        
        viewModel.destinationText = { [weak self] text in
            self?.destinationLabel.text = text
        }
        
        viewModel.destinationPlaceholderText = { [weak self] placeholder in
            self?.destinationTextView.text = placeholder
        }
        
        viewModel.translateText = { [weak self] text in
            self?.translateButton.setTitle(text, for: .normal)
        }
    }
    
    private func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    private func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Placeholder"
            textView.textColor = UIColor.lightGray
        }
    }

    // MARK: - Actions
    
    @IBAction func didPressTranslateButton(_ sender: UIButton) {
    }
}
