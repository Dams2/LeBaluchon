//
//  WeatherDataSource.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 27.01.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

final class WeatherDataSources: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    typealias Item = WeatherViewModel.VisibleItem
    
    private var items: [Item] = []

    func update(with items: [Item]) {
        self.items = items
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard items.count > indexPath.item else {
            return UITableViewCell()
        }

        let visibleItem = items[indexPath.item]
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell", for: indexPath) as! WeatherTableViewCell
        cell.configure(with: visibleItem)
        return cell
    }
}
