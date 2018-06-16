//
//  WeatherList.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import Foundation

struct WeatherList: Codable {
    let mesage: String
    let cod: String
    let count: Int
    let citiesList: [CityInformation]
    
}
