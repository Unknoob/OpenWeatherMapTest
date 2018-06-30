//
//  PreviewRouter.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 19/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import UIKit
import CoreLocation

class PreviewRouter: PreviewRouterProtocol {
    weak var viewController: PreviewViewController?
    weak var containerRouter: ContainerRouterProtocol?
    
    static func build(containerRouter: ContainerRouterProtocol, cityInformation: CityInformation, currentLocation: CLLocation, selectedUnit: TemperatureUnit) -> PreviewViewController {
        let previewViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PreviewViewController") as! PreviewViewController
        
        previewViewController.cityInformation = cityInformation
        previewViewController.currentLocation = currentLocation
        previewViewController.selectedUnit = selectedUnit
        
        let presenter = PreviewPresenter()
        let router = PreviewRouter()
        router.viewController = previewViewController
        router.containerRouter = containerRouter
        
        previewViewController.presenter = presenter

        presenter.viewController = previewViewController
        presenter.router = router
        
        return previewViewController
    }
    
    func selectAnnotation(for cityInformation: CityInformation) {
        containerRouter?.selectAnnotation(for: cityInformation)
    }
}
