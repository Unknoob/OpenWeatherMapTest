//
//  ListInteractorProtocol.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

protocol ListInteractorProtocol: class {
    var presenter: ListPresenterProtocol? { get set }
}