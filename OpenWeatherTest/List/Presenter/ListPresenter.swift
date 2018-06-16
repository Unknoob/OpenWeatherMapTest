//
//  ListPresenter.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

class ListPresenter: ListPresenterProtocol {
    weak var viewController: ListViewControllerProtocol!
    var interactor: ListInteractorProtocol!
    var router: ListRouterProtocol!
}
