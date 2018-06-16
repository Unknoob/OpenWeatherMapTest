//
//  ListPresenterProtocol.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

protocol ListPresenterProtocol: class {
    var viewController: ListViewControllerProtocol! { get set }
    var interactor: ListInteractorProtocol! { get set }
    var router: ListRouterProtocol! { get set }
    
    func cityInformationUpdated(cityInformation: [CityInformation])
}
