//
//  ExchangeViewController.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 22.01.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

final class ExchangeViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBOutlet weak var convertButton: UIButton!
    
    // MARK: - Properties

    weak var coordinator: ExchangeCoordinator?
    
    var viewModel: ExchangeViewModel!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind(to: viewModel)
        viewModel.viewDidLoad()
        
    }
    
    // MARK: - Helpers
    
    private func bind(to viewModel: ExchangeViewModel) {
        
            viewModel.resultText = { [weak self] text in
                DispatchQueue.main.async {
                    self?.resultLabel.text = text
                }
            }
        

        viewModel.amountText = { [weak self] placeholder in
            self?.amountTextField.placeholder = placeholder
        }
        
        viewModel.convertText = { [weak self] text in
            self?.convertButton.setTitle(text, for: .normal)
        }
    }
    
    // MARK: - Actions
    
    @IBAction func didPressConvertButton(_ sender: UIButton) {
        guard let amountText = amountTextField.text else { return }
        viewModel.didPressConvert(amountText: amountText)
    }
}
