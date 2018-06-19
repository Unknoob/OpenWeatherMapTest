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
        return String(format: "%.0f%@", kelvinTemp - 273.15, "ºC")
    }
    
    static func kelvinToFahrenheit(_ kelvinTemp: Double) -> String {
        return String(format: "%.0f%@", kelvinTemp * (9/5) - 459.67, "ºF")
    }
    
    static func temperature(_ temperature: Double, inUnit temperatureUnit: TemperatureUnit) -> String {
        switch temperatureUnit {
        case .celsius:
            return kelvinToCelsius(temperature)
        case .fahrenheit:
            return kelvinToFahrenheit(temperature)
        }
    }
    
    static func metersToKilometers(_ distanceInMeters: Double) -> String {
        return String(format: "%.0f%@", distanceInMeters / 1000, " Km")
    }
    
    static func metersToMiles(_ distanceInMeters: Double) -> String {
        return String(format: "%.0f%@", distanceInMeters / 1609.34, " Mi")
    }
    
    static func distance(_ distance: Double, inUnit distanceUnit: DistanceUnit) -> String {
        switch distanceUnit {
        case .metric:
            return metersToKilometers(distance)
        case .imperial:
            return metersToMiles(distance)
        }
    }
    
    static func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm, dd/MM/yyyy"
        return dateFormatter.string(from: date)
    }
    
}
