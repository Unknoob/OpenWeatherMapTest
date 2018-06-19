//
//  KingfisherHelper.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 18/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import Foundation
import Kingfisher

class KingfisherHelper {
    static func generateURL(fromImageName imageName: String) -> URL? {
        guard let url = URL(string: "https://openweathermap.org/img/w/\(imageName)\(".png")") else {
            return nil
        }
        return url
    }
}
