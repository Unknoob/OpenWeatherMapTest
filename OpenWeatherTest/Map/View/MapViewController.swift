//
//  SecondViewController.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 13/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MapViewControllerProtocol {

    @IBOutlet weak var mapView: MKMapView!
    
    var presenter: MapPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LocationManager.requestUserPermission()
        mapView.showsUserLocation = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

