//
//  DecodingError.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 19/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import Foundation


enum DecodingError: GenericError {
    case decodingError
    
    static func errorWithCode(_ code: Int) -> DecodingError {
        switch code {
        default:
            return .decodingError
        }
    }
    
    var message: String {
        switch self {
        default:
            return "There was an error proccessing the information"
        }
    }
}
