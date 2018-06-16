//
//  CloudInformation.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 16/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

struct CloudInformation: Codable {
    let allCloudsPercentage: Int
    
    enum CodingKeys: String, CodingKey {
        case allCloudsPercentage = "all"
    }
}
