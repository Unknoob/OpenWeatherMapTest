//
//  ContainerInteractorProtocol.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

protocol ContainerInteractorProtocol: class {
    var containerPresenter: ContainerPresenterProtocol? { get set }
    var listPresenter: ListPresenterProtocol? { get set }
    var mapPresenter: MapPresenterProtocol? { get set }
    
    func requestPermission()
}
