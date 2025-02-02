//
//  LocationManager.swift
//  Atmos
//
//  Created by Pratyush Choubey on 30/06/24.
//

import Foundation
import CoreLocation

class LoacationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
           location = locations.first?.coordinate
           isLoading = false
       }

       func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
           print("Error getting location", error)
           isLoading = false
       }
   }
