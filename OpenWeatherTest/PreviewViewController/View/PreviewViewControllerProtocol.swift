//
//  PreviewViewControllerProtocol.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 18/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

protocol PreviewViewControllerProtocol: class {
    var presenter: PreviewPresenterProtocol! { get set }
    
    func showCloseButton(_ shouldShow: Bool)
}
