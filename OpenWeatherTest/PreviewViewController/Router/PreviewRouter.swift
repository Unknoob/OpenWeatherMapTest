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
    
    static func build(cityInformation: CityInformation, currentLocation: CLLocation, selectedUnit: TemperatureUnit) -> PreviewViewController {
        let previewViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PreviewViewController") as! PreviewViewController
        
        previewViewController.cityInformation = cityInformation
        previewViewController.currentLocation = currentLocation
        previewViewController.selectedUnit = selectedUnit
        
        let router = PreviewRouter()
        router.viewController = previewViewController
        
//        previewViewController.presenter = presenter
//
//        presenter.viewController = previewViewController
//        presenter.router = router
        
        return previewViewController
    }
}
