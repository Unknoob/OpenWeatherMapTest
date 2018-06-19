//
//  ContainerViewController.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import UIKit
import CoreLocation
import RxSwift
import RxCocoa

class ContainerViewController: UIViewController, ContainerViewControllerProtocol {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var customNavigation: UINavigationItem!
    @IBOutlet weak var listingToggleButton: UIBarButtonItem!
    @IBOutlet weak var unitToggleButton: UIBarButtonItem!
    
    var listViewController: ListViewController!
    var mapViewController: MapViewController!
    var presenter: ContainerPresenterProtocol!
    var activeView: ViewType = .list
    var selectedUnit: Variable<TemperatureUnit> = Variable(.celsius)
    var currentLocation:  Variable<CLLocation> = Variable(CLLocation())
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toggleListingType(self)
        presenter.interactor.requestPermission()
    
        selectedUnit.asObservable().subscribe({ (temperature) in
            self.listViewController.selectedUnit.value = temperature.element!
            self.mapViewController.selectedUnit.value = temperature.element!
        }).disposed(by: disposeBag)
        
    }
    
    func locationUpdated(location: CLLocation) {
        self.currentLocation.value = location
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func toggleListingType(_ sender: Any) {
        switch activeView {
        case .list:
            mapViewController.willMove(toParentViewController: nil)
            mapViewController.view.removeFromSuperview()
            mapViewController.removeFromParentViewController()
            
            addChildViewController(listViewController)
            
            containerView.addSubview(listViewController.view)
            listViewController.view.frame = containerView.bounds
            listViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            listViewController.didMove(toParentViewController: self)
            
            customNavigation.title = activeView.rawValue
            activeView = .map
            listingToggleButton.title = activeView.rawValue
        case .map:
            listViewController.willMove(toParentViewController: nil)
            listViewController.view.removeFromSuperview()
            listViewController.removeFromParentViewController()
            
            addChildViewController(mapViewController)
            
            containerView.addSubview(mapViewController.view)
            mapViewController.view.frame = containerView.bounds
            mapViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            mapViewController.didMove(toParentViewController: self)
            
            customNavigation.title = activeView.rawValue
            activeView = .list
            listingToggleButton.title = activeView.rawValue
        }
    }
    
    @IBAction func toggleTemperatureUnit(_ sender: Any) {
        switch selectedUnit.value {
        case .celsius:
            unitToggleButton.title = "Cº"
            self.selectedUnit.value = .fahrenheit
        case .fahrenheit:
            unitToggleButton.title = "Fº"
            self.selectedUnit.value = .celsius
        }
    }

}
