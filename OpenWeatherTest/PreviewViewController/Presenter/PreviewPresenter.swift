//
//  PreviewPresenter.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 29/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import Foundation

class PreviewPresenter: PreviewPresenterProtocol {
    weak var viewController: PreviewViewControllerProtocol!
    var router: PreviewRouterProtocol!
    
    func selectAnnotation(for cityInformation: CityInformation) {
        router.selectAnnotation(for: cityInformation)
    }
}
