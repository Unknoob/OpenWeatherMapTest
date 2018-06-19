//
//  ListRouter.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import UIKit

class ListRouter: ListRouterProtocol {
    weak var viewController: ListViewController?
 
    static func build() -> ListViewController {
        let listViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        
        let presenter = ListPresenter()
        let router = ListRouter()
        
        router.viewController = listViewController
        
        listViewController.presenter = presenter
        
        presenter.viewController = listViewController
        presenter.router = router
        
        return listViewController
    }
}
