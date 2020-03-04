//
//  MapViewController.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 28.01.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

extension MapViewController: MKMapViewDelegate {}

final class MapViewController: UIViewController {

    // MARK: - Properties

    weak var coordinator: MapCoordinator?

    private lazy var dataSource = MapViewDataSource()

    // MARK: - Outlets

    @IBOutlet weak var mapView: MKMapView!

    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = dataSource
        dataSource.update(mapView: mapView)
    }
    
    // MARK: - Helpers
    

    
    // MARK: - Actions
}
