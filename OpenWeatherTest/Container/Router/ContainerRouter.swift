//
//  ContainerRouter.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import UIKit

class ContainerRouter: ContainerRouterProtocol {
    weak var viewController: ContainerViewController?
    
    static func build() -> ContainerViewController {
        let containerViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ContainerViewController") as! ContainerViewController
        
        containerViewController.listViewController = ListRouter.build()
        containerViewController.mapViewController = MapRouter.build()
        
        let presenter = ContainerPresenter()
        let interactor = ContainerInteractor()
        let router = ContainerRouter()
        
        router.viewController = containerViewController
        
        interactor.containerPresenter = presenter
        interactor.listPresenter = containerViewController.listViewController.presenter
        interactor.mapPresenter = containerViewController.mapViewController.presenter
        
        containerViewController.presenter = presenter
        
        presenter.viewController = containerViewController
        presenter.interactor = interactor
        presenter.router = router
        
        return containerViewController
    }
}
