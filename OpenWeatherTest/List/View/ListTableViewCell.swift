//
//  ListTableViewCell.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 16/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var minimumTemperatureLabel: UILabel!
    @IBOutlet weak var maximumTemperatureLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    
    var selectedUnit: Variable<TemperatureUnit> = Variable(.celsius)
    var disposeBag = DisposeBag()
    
    private var cityInformation: CityInformation!
    
    func fill(withCityInformation cityInformation: CityInformation, andUnit temperatureUnit: TemperatureUnit) {
        self.cityInformation = cityInformation
        cityLabel.text = cityInformation.name
        
        weatherImageView.kf.setImage(with: URL(string: "https://openweathermap.org/img/w/\(cityInformation.weatherList.first!.icon)\(".png")"))
        
        setTemperatureWithCorrectUnit()
        
        selectedUnit.asObservable().subscribe(onNext: { _ in
            self.setTemperatureWithCorrectUnit()
        }).disposed(by: disposeBag)
        
    }
    
    func setTemperatureWithCorrectUnit() {
        currentTemperatureLabel.text = UnitHelper.temperature(cityInformation.mainInformation.currentTemperature, inUnit: selectedUnit.value)
        minimumTemperatureLabel.text = "Min: \(UnitHelper.temperature(cityInformation.mainInformation.minimumTemperature, inUnit: selectedUnit.value))"
        maximumTemperatureLabel.text = "Max: \(UnitHelper.temperature(cityInformation.mainInformation.maximumTemperature, inUnit: selectedUnit.value))"
    }
    
    override func prepareForReuse() {
        disposeBag = DisposeBag()
    }
}
