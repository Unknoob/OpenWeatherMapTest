//
//  Weather.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

struct Weather: Codable {
    let id: Int
    let name: String
    let description: String
    let icon: String
}
