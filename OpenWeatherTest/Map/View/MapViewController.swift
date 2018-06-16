//
//  SecondViewController.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 13/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import UIKit
import MapKit
import RxSwift
import RxCocoa

class MapViewController: UIViewController, MapViewControllerProtocol {

    @IBOutlet weak var mapView: MKMapView!
    
    var presenter: MapPresenterProtocol!
    var cityInformationList: [CityInformation] = []
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.showsUserLocation = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func updateCityInformation(cityInformationList: [CityInformation]) {
        self.cityInformationList = cityInformationList
    }

}

