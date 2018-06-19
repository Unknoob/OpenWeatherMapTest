//
//  ContainerInteractor.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import CoreLocation
import RxSwift
import RxCocoa

class ContainerInteractor: NSObject, ContainerInteractorProtocol, CLLocationManagerDelegate {
    weak var containerPresenter: ContainerPresenterProtocol?
    weak var listPresenter: ListPresenterProtocol?
    weak var mapPresenter: MapPresenterProtocol?
    
    let locationManager = CLLocationManager()
    let dispose = DisposeBag()
    var lastTimeFetched: Date?
    
    var lastLocationFetched: CLLocation?
    var currentLocation: CLLocation? {
        didSet {
            guard let currentLocation = currentLocation else { return }
            guard let lastLocationFetched = lastLocationFetched else {
                getWeatherInformation()
                return
            }
            if lastLocationFetched.distance(from: currentLocation) > 10.0 {
                getWeatherInformation()
            }
            
        }
    }
    
    var isFetching: Bool = false
    
    func requestPermission() {
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    
    func getWeatherInformation() {
        if !isFetching {
            isFetching = true
            guard let currentLocation = currentLocation else { return }
            
            var parameters: [String: Any] = [:]
            parameters["lat"] = currentLocation.coordinate.latitude
            parameters["lon"] = currentLocation.coordinate.longitude
            
            NetworkManager.request("find", parameters: parameters, httpMethod: .get) { result in
                
                switch result {
                case .success(let jsonData):
                    self.lastLocationFetched = currentLocation
                    do {
                        let weatherInfo: WeatherList = try JSONDecoder().decode(WeatherList.self, from: jsonData)
                        self.listPresenter?.cityInformationUpdated(cityInformation: weatherInfo.citiesList)
                        self.mapPresenter?.cityInformationUpdated(cityInformation: weatherInfo.citiesList)
                        self.isFetching = false
                    } catch {
                        print("Decoding Error: \(error)")
                        self.isFetching = false
                    }
                case .failure(let error):
                    self.containerPresenter?.showErrorMessage(error: error, okBlock: {
                        self.isFetching = false
                    }, retryBlock: {
                        self.isFetching = false
                        self.getWeatherInformation()
                    })
                    
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last {
            currentLocation = lastLocation
            listPresenter?.locationUpdated(location: lastLocation)
            mapPresenter?.locationUpdated(location: lastLocation)
        }
    }
    
    // If we have been deined access give the user the option to change it
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if(status == CLAuthorizationStatus.denied) {
            print("Location Request Refused")
        }
    }
}
