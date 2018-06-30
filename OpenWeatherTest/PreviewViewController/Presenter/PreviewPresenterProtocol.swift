//
//  PreviewPresenterProtocol.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 29/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import Foundation

protocol PreviewPresenterProtocol {
    var viewController: PreviewViewControllerProtocol! { get set }
    var router: PreviewRouterProtocol! { get set }
    
    func selectAnnotation(for cityInformation: CityInformation)
}
