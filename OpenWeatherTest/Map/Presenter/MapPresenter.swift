//
//  MapPresenter.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

class MapPresenter: MapPresenterProtocol {
    weak var viewController: MapViewControllerProtocol!
    var interactor: MapInteractorProtocol!
    var router: MapRouterProtocol!
    
    func cityInformationUpdated(cityInformation: [CityInformation]) {
        viewController.updateCityInformation(cityInformationList: cityInformation)
    }
}
