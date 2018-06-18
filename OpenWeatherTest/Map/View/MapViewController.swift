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

class MapViewController: UIViewController, MapViewControllerProtocol, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var presenter: MapPresenterProtocol!
    var cityInformationList: Variable<[CityInformation]> = Variable([])
    var selectedUnit: Variable<TemperatureUnit> = Variable(.celsius)
    var currentLocation:  Variable<CLLocation> = Variable(CLLocation())
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.showsUserLocation = true
        
        self.currentLocation.asObservable().subscribe({ (currentLocation) in
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(currentLocation.element!.coordinate, 50000, 50000)
            self.mapView.setRegion(coordinateRegion, animated: true)
        }).disposed(by: disposeBag)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func cityInformationUpdated(cityInformationList: [CityInformation]) {
        self.cityInformationList.value = cityInformationList
        
        cityInformationList.forEach { cityInformation in
            let annotation = MapAnnotation(title: UnitHelper.temperature(cityInformation.mainInformation.currentTemperature, inUnit: selectedUnit.value), locationName: cityInformation.name, discipline: "TEST", imageName: cityInformation.weatherList.first!.icon, coordinate: CLLocationCoordinate2D(latitude: cityInformation.coordinates.latitude, longitude: cityInformation.coordinates.longitude))
            mapView.addAnnotation(annotation)
        }
    }
    
    func locationUpdated(location: CLLocation) {
        currentLocation.value = location
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // 2
        guard let annotation = annotation as? MapAnnotation else { return nil }
        // 3
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        // 4
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            // 5
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
    
}

