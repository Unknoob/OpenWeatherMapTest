//
//  PreviewViewController.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 18/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import UIKit
import CoreLocation
import Kingfisher

class PreviewViewController: UIViewController, PreviewViewControllerProtocol {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var minimumTemperatureLabel: UILabel!
    @IBOutlet weak var maximumTemperatureLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var windTitleLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var windDirectionLabel: UILabel!
    @IBOutlet weak var airTitleLabel: UILabel!
    @IBOutlet weak var airPressureLabel: UILabel!
    @IBOutlet weak var airHumidityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    
    var presenter: PreviewPresenterProtocol!
    var cityInformation: CityInformation!
    var currentLocation: CLLocation!
    var selectedUnit: TemperatureUnit!
    
    override var previewActionItems: [UIPreviewActionItem] {
        let showAction = UIPreviewAction(title: "Show on map", style: .default) { _, _ in
            self.presenter.selectAnnotation(for: self.cityInformation)
        }
        
        let dismissAction = UIPreviewAction(title: "Dismiss", style: .destructive) { _, _ in
            
        }
        
        return [showAction, dismissAction]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageName = cityInformation.weatherList.first?.icon {
            imageView.kf.setImage(with: KingfisherHelper.generateURL(fromImageName: imageName))
        }
        currentTemperatureLabel.text = UnitHelper.temperature(cityInformation.mainInformation.currentTemperature, inUnit: selectedUnit)
        minimumTemperatureLabel.text = "Min: \(UnitHelper.temperature(cityInformation.mainInformation.minimumTemperature, inUnit: selectedUnit))"
        maximumTemperatureLabel.text = "Max: \(UnitHelper.temperature(cityInformation.mainInformation.maximumTemperature, inUnit: selectedUnit))"
        
        cityNameLabel.text = cityInformation.name
        latitudeLabel.text = "Latitude: \(cityInformation.coordinates.latitude)"
        longitudeLabel.text = "Longitude: \(cityInformation.coordinates.longitude)"
        
        let cityLocation = CLLocation(latitude: cityInformation.coordinates.latitude, longitude: cityInformation.coordinates.longitude)
        distanceLabel.text = "Distance: \(UnitHelper.distance(cityLocation.distance(from: currentLocation), inUnit: .metric))"
        
        if let windSpeed = cityInformation.windInformation.speed {
            windSpeedLabel.text = "Speed: \(windSpeed) m/s"
            windSpeedLabel.isHidden = false
        } else {
            windSpeedLabel.isHidden = true
        }
        
        if let windDirection = cityInformation.windInformation.degrees {
            windDirectionLabel.text = "Direction: \(windDirection) degrees"
            windDirectionLabel.isHidden = false
        } else {
            windDirectionLabel.isHidden = true
        }
        
        windTitleLabel.isHidden = windSpeedLabel.isHidden && windDirectionLabel.isHidden
        
        airPressureLabel.text = "Pressure: \(cityInformation.mainInformation.airPressure) hPa"
        airHumidityLabel.text = "Humidity: \(cityInformation.mainInformation.airHumidity) %"
        dateLabel.text = "Last updated: \(UnitHelper.formatDate(date: cityInformation.date))"
    }
    
    func showCloseButton(_ shouldShow: Bool) {
        closeButton.isHidden = !shouldShow
    }
    
    @IBAction func didTouchCloseButton(_ sender: UIButton) {
        self.presenter.router.dismiss()
    }
    
}
