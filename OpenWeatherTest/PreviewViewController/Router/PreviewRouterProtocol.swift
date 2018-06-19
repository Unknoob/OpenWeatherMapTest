//
//  PreviewRouterProtocol.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 19/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import CoreLocation

protocol PreviewRouterProtocol: class {
    var viewController: PreviewViewController? { get set }
    static func build(cityInformation: CityInformation, currentLocation: CLLocation, selectedUnit: TemperatureUnit) -> PreviewViewController
}

