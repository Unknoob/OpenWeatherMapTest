//
//  ContainerPresenter.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import RxSwift
import RxCocoa

class ContainerPresenter: ContainerPresenterProtocol {
    weak var viewController: ContainerViewControllerProtocol!
    var interactor: ContainerInteractorProtocol!
    var router: ContainerRouterProtocol!
    var dispose = DisposeBag()
    
    var currentLocation: Coordinates?
    
    func coordinatesUpdated(coordinates: Coordinates) {
        self.currentLocation = coordinates
        print(coordinates)
    }
    
}
