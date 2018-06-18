//
//  ListViewControllerProtocol.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import CoreLocation

protocol ListViewControllerProtocol: class {
    var presenter: ListPresenterProtocol! { get set }
    func cityInformationUpdated(cityInformationList: [CityInformation])
    func locationUpdated(location: CLLocation)
}
