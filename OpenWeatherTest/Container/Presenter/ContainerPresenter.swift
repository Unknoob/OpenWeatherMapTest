//
//  ContainerPresenter.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import RxSwift
import RxCocoa
import CoreLocation

class ContainerPresenter: ContainerPresenterProtocol {
    weak var viewController: ContainerViewControllerProtocol!
    var interactor: ContainerInteractorProtocol!
    var router: ContainerRouterProtocol!
    var dispose = DisposeBag()
    
    weak var listPresenter: ListPresenterProtocol?
    weak var mapPresenter: MapPresenterProtocol?
    
    func locationUpdated(location: CLLocation) {
        self.viewController.locationUpdated(location: location)
        listPresenter?.locationUpdated(location: location)
        mapPresenter?.locationUpdated(location: location)
    }
    
    func cityInformationUpdated(cityInformation: [CityInformation]) {
        listPresenter?.cityInformationUpdated(cityInformation: cityInformation)
        mapPresenter?.cityInformationUpdated(cityInformation: cityInformation)
    }
    
}
