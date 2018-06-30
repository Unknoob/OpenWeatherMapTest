//
//  Constants.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import Foundation

/// An enum containing the possible results of a request.
/// - failure: Returns a GenericError.
/// - success: Returns a Value specified on implementation.
public enum Result<Value> {
    /// Returns a GenericError.
    case failure(GenericError)
    /// Returns a value specified on implementation.
    case success(Value)
}

/// An enum containing the types of visualization allowed.
/// - list: The list visualization mode.
/// - map: The map visualization mode.
public enum ViewType {
    /// The list visualization mode.
    case list
    /// The map visualization mode.
    case map
}

/// An enum containing the temperature units allowed.
/// - celsius: The metric unit for temperature.
/// - fahrenheit: The imperial unit for temperature.
public enum TemperatureUnit {
    /// The metric unit for temperature.
    case celsius
    /// The imperial unit for temperature.
    case fahrenheit
}

public enum DistanceUnit {
    case metric
    case imperial
}

/// A normal Dictionary.
public typealias JSONDictionary = [String: Any]
/// An array of Dictionaries.
public typealias JSONArray = [JSONDictionary]
