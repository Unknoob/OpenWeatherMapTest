//
//  MapAnnotationView.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 17/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import UIKit
import MapKit
import Kingfisher

class MapAnnotationView: MKAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            guard let annotation = newValue as? MapAnnotation else {return}
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
            if let imageName = annotation.imageName, let imageURL = URL(string: "https://openweathermap.org/img/w/\(imageName)\(".png")") {
                KingfisherManager.shared.retrieveImage(with: imageURL, options: nil, progressBlock: nil, completionHandler: { downloadedImage, error, cacheType, imageURL in
                    self.image = downloadedImage
                })
            } else {
                image = nil
            }
        }
    }
}
