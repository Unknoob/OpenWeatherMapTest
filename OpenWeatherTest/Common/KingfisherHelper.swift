//
//  KingfisherHelper.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 18/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import Foundation
import Kingfisher

/// Helper for Kingfisher related functions.
class KingfisherHelper {
    /// Generates the full URL for a given icon name.
    /// - Parameters:
    ///     - imageName: The code of the icon we want to fetch.
    ///  - Returns: The full URL for the given icon code.
    static func generateURL(fromImageName imageName: String) -> URL? {
        guard let url = URL(string: "https://openweathermap.org/img/w/\(imageName)\(".png")") else {
            return nil
        }
        return url
    }
}
