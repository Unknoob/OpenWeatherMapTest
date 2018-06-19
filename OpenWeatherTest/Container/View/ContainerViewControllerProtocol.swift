//
//  ContainerViewControllerProtocol.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import CoreLocation
import UIKit

protocol ContainerViewControllerProtocol: class {
    var presenter: ContainerPresenterProtocol! { get set }
    func locationUpdated(location: CLLocation)
}
