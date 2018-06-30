//
//  MapViewControllerProtocol.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import CoreLocation

protocol MapViewControllerProtocol: class {
    var presenter: MapPresenterProtocol! { get set }
    func selectAnnotation(for cityInformation: CityInformation)
    func cityInformationUpdated(cityInformationList: [CityInformation])
    func locationUpdated(location: CLLocation)
}
