//
//  ContainerPresenter.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import RxSwift
import RxCocoa
import CoreLocation

class ContainerPresenter: ContainerPresenterProtocol {
    weak var viewController: ContainerViewControllerProtocol!
    var interactor: ContainerInteractorProtocol!
    var router: ContainerRouterProtocol!
    var dispose = DisposeBag()

    func showErrorMessage(error: GenericError, okBlock: @escaping () -> (), retryBlock: @escaping () -> ()) {
        router.showErrorMessage(error: error, okBlock: okBlock, retryBlock: retryBlock)
    }
}
