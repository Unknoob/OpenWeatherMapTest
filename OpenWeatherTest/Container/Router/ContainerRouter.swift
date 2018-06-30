//
//  ContainerRouter.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import UIKit
import CoreLocation

class ContainerRouter: ContainerRouterProtocol {
    weak var viewController: ContainerViewController?
    
    static func build() -> ContainerViewController {
        let containerViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ContainerViewController") as! ContainerViewController
    
        let presenter = ContainerPresenter()
        let interactor = ContainerInteractor()
        let router = ContainerRouter()
        
        containerViewController.listViewController = buildListViewController(router: router)
        containerViewController.mapViewController = buildMapViewController(router: router)
        
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
    
    private static func buildMapViewController(router: ContainerRouterProtocol) -> MapViewController {
        let mapViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MapViewController") as! MapViewController

        let presenter = MapPresenter()

        mapViewController.presenter = presenter

        presenter.viewController = mapViewController
        presenter.router = router

        return mapViewController
    }

    private static func buildListViewController(router: ContainerRouterProtocol) -> ListViewController {
        let listViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ListViewController") as! ListViewController

        let presenter = ListPresenter()

        listViewController.presenter = presenter

        presenter.viewController = listViewController
        presenter.router = router

        return listViewController
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
    
    func prepareForceTouchPreview(cityInformation: CityInformation, currentLocation: CLLocation, selectedUnit: TemperatureUnit) -> PreviewViewController {
        return PreviewRouter.build(containerRouter: self, cityInformation: cityInformation, currentLocation: currentLocation, selectedUnit: selectedUnit)
    }
    
    func showPreviewViewController(previewViewController: PreviewViewController) {
        previewViewController.showCloseButton(true)
        viewController?.present(previewViewController, animated: false, completion: nil)
    }
    
    func selectAnnotation(for cityInformation: CityInformation) {
        viewController?.showMap()
        viewController?.mapViewController.presenter.selectAnnotation(for: cityInformation)
    }
}
