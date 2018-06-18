//
//  Constants.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import Foundation

/// An enum containing the possible results of a request.
/// - failure: Returns an Error.
/// - success: Returns a Value specified on implementation.
public enum Result<Value> {
    /// - failure: Returns an NSError.
    case failure(Error)
    /// - success: Returns a value specified on implementation.
    case success(Value)
}

public enum ViewType: String {
    case list = "List"
    case map = "Map"
}

public enum TemperatureUnit {
    case celsius
    case fahrenheit
}

public enum DistanceUnit {
    case metric
    case imperial
}

/// A normal Dictionary
public typealias JSONDictionary = [String: Any]
/// An array of dictionaries
public typealias JSONArray = [JSONDictionary]
