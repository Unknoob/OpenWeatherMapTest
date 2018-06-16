//
//  MapViewControllerProtocol.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

protocol MapViewControllerProtocol: class {
    var presenter: MapPresenterProtocol! { get set }
    func updateCityInformation(cityInformationList: [CityInformation])
}
