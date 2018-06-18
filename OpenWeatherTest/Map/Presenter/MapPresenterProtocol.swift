//
//  MapPresenterProtocol.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import CoreLocation

protocol MapPresenterProtocol: class {
    var viewController: MapViewControllerProtocol! { get set }
    var interactor: MapInteractorProtocol! { get set }
    var router: MapRouterProtocol! { get set }
    
    func cityInformationUpdated(cityInformation: [CityInformation])
    func locationUpdated(location: CLLocation)
}
