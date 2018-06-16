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
    let dispose = DisposeBag()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            
        }
    }
    
    // If we have been deined access give the user the option to change it
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if(status == CLAuthorizationStatus.denied) {
            
        }
    }
}
