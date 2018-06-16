//
//  WeatherList.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import Foundation

struct WeatherList: Codable {
    let message: String
    let cod: String
    let count: Int
    let citiesList: [CityInformation]
    
    enum CodingKeys: String, CodingKey {
        case message
        case cod
        case count
        case citiesList = "list"
    }
}
