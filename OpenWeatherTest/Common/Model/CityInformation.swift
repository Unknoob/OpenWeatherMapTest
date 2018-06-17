//
//  CityInformation.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import Foundation

struct CityInformation: Codable {
    let id: Int
    let name: String
    let coordinates: Coordinates
    let mainInformation: MainInformation
    let date: Date
    let weatherList: [Weather]
//    let rain: String?
//    let snow: String?
    let cloudInformation: CloudInformation
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case coordinates = "coord"
        case mainInformation = "main"
        case date = "dt"
        case weatherList = "weather"
//        case rain
//        case snow
        case cloudInformation = "clouds"
    }
}
