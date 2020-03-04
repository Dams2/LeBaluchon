//
//  MapViewDataSource.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 04.03.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit
import MapKit

final class MapViewDataSource: NSObject, MKMapViewDelegate {
    
    let locationManager = CLLocationManager()
    
    func update(mapView: MKMapView) {
        checkLocationServices(mapView: mapView)
    }
    
    private func checkLocationServices(mapView: MKMapView) {
        if CLLocationManager.locationServicesEnabled() {
            checkAuthorizationStatus(mapView: mapView)
        } else {
           // Do something to let users know why they need to turn it on.
            print("location service is not ready")
        }
    }
    
    private func checkAuthorizationStatus(mapView: MKMapView) {
      switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
        case .denied: break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted: break
        case .authorizedAlways: break
      }
    }
}
