//
//  ContainerViewController.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController, ContainerViewControllerProtocol {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var listingToggleButton: UIBarButtonItem!
    
    var listViewController: ListViewController!
    
    var mapViewController: MapViewController!
    
    var presenter: ContainerPresenterProtocol!
    
    var activeView: ViewType = .list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toggleListingType(self)
        presenter.interactor.requestPermission()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func toggleListingType(_ sender: Any) {
        switch activeView {
        case .list:
            listingToggleButton.title = "Map"
            mapViewController.willMove(toParentViewController: nil)
            mapViewController.view.removeFromSuperview()
            mapViewController.removeFromParentViewController()
            
            addChildViewController(listViewController)
            
            containerView.addSubview(listViewController.view)
            listViewController.view.frame = containerView.bounds
            listViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            listViewController.didMove(toParentViewController: self)
            
            self.activeView = .map
        case .map:
            listingToggleButton.title = "List"
            listViewController.willMove(toParentViewController: nil)
            listViewController.view.removeFromSuperview()
            listViewController.removeFromParentViewController()
            
            addChildViewController(mapViewController)
            
            containerView.addSubview(mapViewController.view)
            mapViewController.view.frame = containerView.bounds
            mapViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            mapViewController.didMove(toParentViewController: self)
            
            self.activeView = .list
        }
    }
}
