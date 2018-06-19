//
//  Error+Code.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 18/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import Foundation

extension Error {
    var code: Int {
        get {
            return (self as NSError).code
        }
    }
}
