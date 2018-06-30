//
//  ContainerRouterProtocol.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import CoreLocation

protocol ContainerRouterProtocol: class {
    var viewController: ContainerViewController? { get set }
    static func build() -> ContainerViewController
    func showErrorMessage(error: GenericError, okBlock: @escaping () -> (), retryBlock: @escaping () -> ())
    func showErrorAndSendToSettings()
    
    func prepareForceTouchPreview(cityInformation: CityInformation, currentLocation: CLLocation, selectedUnit: TemperatureUnit) -> PreviewViewController
    func selectAnnotation(for cityInformation: CityInformation)
}

