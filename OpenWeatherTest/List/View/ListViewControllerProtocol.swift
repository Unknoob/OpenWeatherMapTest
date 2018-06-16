//
//  ListViewControllerProtocol.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

protocol ListViewControllerProtocol: class {
    var presenter: ListPresenterProtocol! { get set }
    func updateCityInformation(cityInformationList: [CityInformation])
}
