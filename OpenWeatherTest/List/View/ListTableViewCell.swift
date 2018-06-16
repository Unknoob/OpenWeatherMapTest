//
//  ListTableViewCell.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 16/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cityLabel: UILabel!
    
    func fill(withCityInformation cityInformation: CityInformation) {
        cityLabel.text = cityInformation.name
    }
}
