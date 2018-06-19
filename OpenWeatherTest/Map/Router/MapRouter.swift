//
//  MapRouter.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import UIKit

class MapRouter: MapRouterProtocol {
    weak var viewController: MapViewController?
    
    static func build() -> MapViewController {
        let mapViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        
        let presenter = MapPresenter()
        let router = MapRouter()
        
        router.viewController = mapViewController
        
        mapViewController.presenter = presenter
        
        presenter.viewController = mapViewController
        presenter.router = router
        
        return mapViewController
    }
}
