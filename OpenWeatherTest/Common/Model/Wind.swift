//
//  Wind.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

struct Wind: Codable {
    let speed: Double
    let degrees: Int
    let gust: Int
    
    enum CodingKeys: String, CodingKey {
        case speed
        case degrees = "deg"
        case gust
    }
}
