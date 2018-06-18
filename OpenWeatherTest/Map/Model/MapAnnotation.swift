//
//  MapAnnotation.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 17/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import MapKit

class MapAnnotation: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    var imageName: String?
    
    init(title: String, locationName: String, discipline: String, imageName: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.imageName = imageName
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}
