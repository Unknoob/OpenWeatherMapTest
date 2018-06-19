//
//  ListPresenter.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import CoreLocation

class ListPresenter: ListPresenterProtocol {
    weak var viewController: ListViewControllerProtocol!
    var router: ListRouterProtocol!
    
    func cityInformationUpdated(cityInformation: [CityInformation]) {
        viewController.cityInformationUpdated(cityInformationList: cityInformation)
    }
    
    func locationUpdated(location: CLLocation) {
        viewController.locationUpdated(location: location)
    }
}
