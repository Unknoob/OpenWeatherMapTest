//
//  LocationManager.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager {
    private static let locationManager = CLLocationManager()
    
    static var isLocationEnabled: Bool {
        return CLLocationManager.authorizationStatus() == .authorizedWhenInUse
    }
    
    static func requestUserPermission() {
         locationManager.requestWhenInUseAuthorization()
    }
    
}
