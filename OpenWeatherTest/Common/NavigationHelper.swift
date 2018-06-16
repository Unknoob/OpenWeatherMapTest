//
//  NavigationHelper.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import Foundation
import UIKit

class NavigationHelper {
    static func configureNavigationButtons(forNavigationController navigationController: UINavigationController?, andViewType viewType: ViewType) {
        switch viewType {
        case .list:
            ///Configuring for list
            let unitButton = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
            unitButton.widthAnchor.constraint(equalToConstant: 24)
            unitButton.heightAnchor.constraint(equalToConstant: 24)
            unitButton.setTitle("F", for: .normal)
            let mapButton = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
            mapButton.widthAnchor.constraint(equalToConstant: 24)
            mapButton.heightAnchor.constraint(equalToConstant: 24)
            mapButton.setTitle("MAP", for: .normal)
            
            navigationController?.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: unitButton), UIBarButtonItem(customView: mapButton)]
            
        case.map:
            ///Configuring for list
            let unitButton = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
            unitButton.widthAnchor.constraint(equalToConstant: 24)
            unitButton.heightAnchor.constraint(equalToConstant: 24)
            unitButton.setTitle("F", for: .normal)
            let listButton = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
            listButton.widthAnchor.constraint(equalToConstant: 24)
            listButton.heightAnchor.constraint(equalToConstant: 24)
            listButton.setTitle("LIST", for: .normal)
            
            navigationController?.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: unitButton), UIBarButtonItem(customView: listButton)]
        }
    }
}
