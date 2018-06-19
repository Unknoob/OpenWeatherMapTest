//
//  ListRouterProtocol.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import CoreLocation

protocol ListRouterProtocol: class {
    var viewController: ListViewController? { get set }
    static func build() -> ListViewController
    func prepareForceTouchPreview(cityInformation: CityInformation, currentLocation: CLLocation, selectedUnit: TemperatureUnit) -> PreviewViewController
}
