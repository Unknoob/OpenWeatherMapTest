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
import Kingfisher

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
        mapView.delegate = self
        
        self.currentLocation.asObservable().subscribe({ (currentLocation) in
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(currentLocation.element!.coordinate, 50000, 50000)
            self.mapView.setRegion(coordinateRegion, animated: true)
        }).disposed(by: disposeBag)
        
        self.selectedUnit.asObservable().subscribe({ (selectedUnit) in
            self.reloadAnnotations()
        }).disposed(by: disposeBag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func cityInformationUpdated(cityInformationList: [CityInformation]) {
        self.cityInformationList.value = cityInformationList
        reloadAnnotations()
    }
    
    func reloadAnnotations() {
        mapView.removeAnnotations(mapView.annotations)
        self.cityInformationList.value.forEach { cityInformation in
            let annotation = MapAnnotation(title: UnitHelper.temperature(cityInformation.mainInformation.currentTemperature, inUnit: selectedUnit.value), locationName: cityInformation.name, imageName: cityInformation.weatherList.first!.icon, coordinate: CLLocationCoordinate2D(latitude: cityInformation.coordinates.latitude, longitude: cityInformation.coordinates.longitude))
            
            mapView.addAnnotation(annotation)
        }
    }
    
    func locationUpdated(location: CLLocation) {
        currentLocation.value = location
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? MapAnnotation else { return nil }
        let identifier = MKMapViewDefaultAnnotationViewReuseIdentifier
        var view: MKMarkerAnnotationView
        
        view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        view.canShowCallout = true
        view.calloutOffset = CGPoint(x: 0, y: 20)
        let mapsButton = UIButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 30, height: 30)))
        
        if let imageName = annotation.imageName, let imageURL = KingfisherHelper.generateURL(fromImageName: imageName) {
            KingfisherManager.shared.retrieveImage(with: imageURL, options: nil, progressBlock: nil, completionHandler: { downloadedImage, error, cacheType, imageURL in
                mapsButton.setBackgroundImage(downloadedImage, for: .normal)
            })
        }
        
        view.rightCalloutAccessoryView = mapsButton
        
        return view
    }
    
}

