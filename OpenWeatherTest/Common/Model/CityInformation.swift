//
//  CityInformation.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import Foundation

struct CityInformation: Codable {
    let id: Int
    let name: String
    let coordinates: Coordinates
    let mainInformation: MainInformation
    let date: Date
    let weatherList: [Weather]
    let windInformation: Wind
//    let rain: String?
//    let snow: String?
    let cloudInformation: CloudInformation
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case coordinates = "coord"
        case mainInformation = "main"
        case date = "dt"
        case weatherList = "weather"
        case windInformation = "wind"
//        case rain
//        case snow
        case cloudInformation = "clouds"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        coordinates = try container.decode(Coordinates.self, forKey: .coordinates)
        mainInformation = try container.decode(MainInformation.self, forKey: .mainInformation)
        
        let dateTimestamp = try container.decode(Double.self, forKey: .date)
        date = Date(timeIntervalSince1970: dateTimestamp)
        
        weatherList = try container.decode([Weather].self, forKey: .weatherList)
        windInformation = try container.decode(Wind.self, forKey: .windInformation)
        cloudInformation = try container.decode(CloudInformation.self, forKey: .cloudInformation)
    }
}
