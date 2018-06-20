//
//  ContainerPresenterProtocol.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import RxSwift
import RxCocoa
import CoreLocation

protocol ContainerPresenterProtocol: class {
    var viewController: ContainerViewControllerProtocol! { get set }
    var interactor: ContainerInteractorProtocol! { get set }
    var router: ContainerRouterProtocol! { get set }
    func showErrorMessage(error: GenericError, okBlock: @escaping () -> (), retryBlock: @escaping () -> ())
    func showErrorAndSendToSettings()
    func startLoading()
    func stopLoading()
}
