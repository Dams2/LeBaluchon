//
//  WeatherViewModel.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 11.12.19.
//  Copyright © 2019 Damien Rojo. All rights reserved.
//

import Foundation

final class WeatherViewModel {
    
    // MARK: - Outputs
    
    var segments: (([SegmentItem]) -> Void)?
    
    enum SegmentItem {
        case newYork(conditions: Conditions)
        case geneva(conditions: Conditions)
    }
    
    // MARK: - Inputs
    
    func didPressCity() {
        
    }
    
}
