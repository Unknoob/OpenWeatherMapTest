//
//  ContainerInteractorProtocol.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

protocol ContainerInteractorProtocol: class {
    var presenter: ContainerPresenterProtocol? { get set }
    
    func requestPermission()
}
