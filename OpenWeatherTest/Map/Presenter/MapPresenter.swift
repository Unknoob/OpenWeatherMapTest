//
//  MapPresenter.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import CoreLocation

class MapPresenter: MapPresenterProtocol {
    weak var viewController: MapViewControllerProtocol!
    var router: ContainerRouterProtocol!
    
    func selectAnnotation(for cityInformation: CityInformation) {
        viewController.selectAnnotation(for: cityInformation)
    }
    
    func cityInformationUpdated(cityInformation: [CityInformation]) {
        viewController.cityInformationUpdated(cityInformationList: cityInformation)
    }
    
    func locationUpdated(location: CLLocation) {
        viewController.locationUpdated(location: location)
    }
}
