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
    weak var presenter: ContainerPresenterProtocol?
    weak var listDelegate: ListInteractor?
    weak var mapDelegate: MapInteractor?
    
    let locationManager = CLLocationManager()
    let dispose = DisposeBag()
    var timer: Timer?
    
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
            //            setupTimer()
            //            getWeatherInformationIfNeeded()
        }
    }
    
    //    func setupTimer() {
    //        self.timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(self.getWeatherInformation), userInfo: nil, repeats: true)
    //
    //    }
    
    //    var shouldUpdateWeatherInfo: Bool {
    //        guard let currentLocation = currentLocation else {
    //            return false
    //        }
    //
    //        guard let lastLocationFetched = lastLocationFetched else {
    //            return true
    //        }
    //
    //        return lastLocationFetched.distance(from: currentLocation) > 10.0
    //    }
    
    func getWeatherInformation() {
        if !isFetching {
            isFetching = true
            guard let currentLocation = currentLocation else { return }
            
            var parameters: [String: Any] = [:]
            parameters["lat"] = currentLocation.coordinate.latitude
            parameters["lon"] = currentLocation.coordinate.longitude
            
            NetworkManager.request("find", parameters: parameters, httpMethod: .get) { result in
                self.isFetching = false
                switch result {
                case .success(let jsonData):
                    print("YES")
                    self.lastLocationFetched = currentLocation
                    do {
                        let weatherInfo: WeatherList = try JSONDecoder().decode(WeatherList.self, from: jsonData)
                        print(weatherInfo)
                    } catch {
                        print("Decoding Error: \(error)")
                    }
                case .failure(let error):
                    print("NO")
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            currentLocation = locations.last
            presenter?.coordinatesUpdated(coordinates: Coordinates(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude))
        }
    }
    
    // If we have been deined access give the user the option to change it
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if(status == CLAuthorizationStatus.denied) {
            print("Location Request Refused")
        }
    }
}
