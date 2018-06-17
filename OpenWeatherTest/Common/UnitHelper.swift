//
//  UnitHelper.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 16/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import Foundation

class UnitHelper {
    static func kelvinToCelsius(_ kelvinTemp: Double) -> String {
        return String(format: "%.0f%@", kelvinTemp - 273.15, " ºC")
    }
    
    static func kelvinToFahrenheit(_ kelvinTemp: Double) -> String {
        return String(format: "%.0f%@", kelvinTemp * (9/5) - 459.67, " ºF")
    }
    
    static func temperature(_ temperature: Double, inUnit temperatureUnit: TemperatureUnit) -> String {
        switch temperatureUnit {
        case .celsius:
            return kelvinToCelsius(temperature)
        case .fahrenheit:
            return kelvinToFahrenheit(temperature)
        }
    }
}
