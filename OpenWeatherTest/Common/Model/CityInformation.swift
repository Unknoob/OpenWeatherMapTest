//
//  CityInformation.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

struct CityInformation: Codable {
    let cityID: Int
    let cityName: String
    let coordinates: Coordinates
    let currentTemperature: Double
    let airPressure: Int
    let airHumidity: Int
    let minimumTemperature: Double
    let maximumTemperature: Double
    let date: Date
    let weatherList: [Weather]
    let rain: String?
    let snow: String?
    let cloudPercentage: Int
}
