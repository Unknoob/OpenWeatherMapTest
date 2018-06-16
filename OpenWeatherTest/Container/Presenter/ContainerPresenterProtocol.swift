//
//  ContainerPresenterProtocol.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

protocol ContainerPresenterProtocol: class {
    var viewController: ContainerViewControllerProtocol! { get set }
    var interactor: ContainerInteractorProtocol! { get set }
    var router: ContainerRouterProtocol! { get set }
}
