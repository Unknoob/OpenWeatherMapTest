//
//  ListRouter.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import UIKit
import CoreLocation

//class ListRouter: ListRouterProtocol {
//    weak var viewController: ListViewController?
//    weak var containerRouter: ContainerRouterProtocol?
//
//    static func build(containerRouter: ContainerRouterProtocol) -> ListViewController {
//        let listViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
//        
//        let presenter = ListPresenter()
//        let router = ListRouter()
//        
//        router.viewController = listViewController
//        router.containerRouter = containerRouter
//        
//        listViewController.presenter = presenter
//        
//        presenter.viewController = listViewController
//        presenter.router = router
//        
//        return listViewController
//    }
//
//    func prepareForceTouchPreview(cityInformation: CityInformation, currentLocation: CLLocation, selectedUnit: TemperatureUnit) -> PreviewViewController {
//        return PreviewRouter.build(containerRouter: containerRouter, cityInformation: cityInformation, currentLocation: currentLocation, selectedUnit: selectedUnit)
//    }
//}
