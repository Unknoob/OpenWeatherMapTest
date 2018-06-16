//
//  RootRouter.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import UIKit

class RootRouter: RootRouterProtocol {
    func showList(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = ContainerRouter.build()
    }
}
