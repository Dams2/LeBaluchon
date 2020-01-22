//
//  UIViewController+Commons.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 22.01.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

extension UIViewController {

    public static var storyboardIdentifier: String {
        return String(describing: self)
    }

    public static var nib: UINib {
        return UINib.init(nibName: storyboardIdentifier, bundle: Bundle(for: self))
    }
}
