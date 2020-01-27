//
//  WeatherViewController.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 22.01.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

final class WeatherViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Public Properties
    
    weak var coordinator: WeatherCoordinator?

    var viewModel: WeatherViewModel!
    
    // MARK: - Private Properties()

    private lazy var dataSource = WeatherDataSources()
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        
        bind(to: viewModel)
        
        viewModel.viewDidLoad()
    }
    
    // MARK: - Actions
    
    private func bind(to viewModel: WeatherViewModel) {
        
        viewModel.items = { [weak self] items in
            DispatchQueue.main.async {
                self?.dataSource.update(with: items)
                self?.tableView.reloadData()
            }
        }
    }
    
}
