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
    
    func showErrorMessage(error: GenericError, okBlock: @escaping () -> (), retryBlock: @escaping () -> ()) {
        let alertController = UIAlertController(title: "Something went wrong", message: error.message, preferredStyle: .alert)
        
        let dismissOption = UIAlertAction(title: "OK", style: .default) { _ in
            okBlock()
        }
        alertController.addAction(dismissOption)
        
        let retryOption = UIAlertAction(title: "Retry", style: .default) { _ in
            retryBlock()
        }
        
        alertController.addAction(retryOption)
        
        viewController?.present(alertController, animated: true, completion: nil)
    }
    
    func showErrorAndSendToSettings() {
        let alertController = UIAlertController(title: "Location Error", message: "If you don't allow us to see your location we can't display the weather. :(", preferredStyle: .alert)
        
        let dismissOption = UIAlertAction(title: "Ignore", style: .default)
        alertController.addAction(dismissOption)
        
        let settingsOption = UIAlertAction(title: "Go to location settings", style: .default) { _ in
            guard let settingsURL = URL(string: UIApplicationOpenSettingsURLString) else { return }
            UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
        }
        
        alertController.addAction(settingsOption)
        
        viewController?.present(alertController, animated: true, completion: nil)
    }
}
