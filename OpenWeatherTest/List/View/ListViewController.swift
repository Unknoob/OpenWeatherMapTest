//
//  FirstViewController.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 13/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import UIKit
import CoreLocation
import RxSwift
import RxCocoa

class ListViewController: UIViewController, ListViewControllerProtocol {
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: ListPresenterProtocol!
    var cityInformationList: Variable<[CityInformation]> = Variable([])
    var selectedUnit: Variable<TemperatureUnit> = Variable(.celsius)
    var currentLocation:  Variable<CLLocation> = Variable(CLLocation())
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityInformationList.asObservable().bind(to: tableView.rx.items(cellIdentifier: "ListTableViewCell", cellType: ListTableViewCell.self)) { (_, cityInformation: CityInformation, cell: ListTableViewCell) in
            cell.fill(withCityInformation: cityInformation, andUnit: self.selectedUnit.value)
            self.selectedUnit.asObservable().subscribe({ (temperature) in
                cell.selectedUnit.value = temperature.element!
            }).disposed(by: cell.disposeBag)
            self.currentLocation.asObservable().subscribe({ currentLocation in
                cell.currentLocation.value = currentLocation.element!
            }).disposed(by: cell.disposeBag)
            
        }.disposed(by: disposeBag)
        
        currentLocation.asObservable().subscribe({ ObserverType in
            self.cityInformationList.value = self.cityInformationList.value.sorted(by: { lhs, rhs -> Bool in
                return self.currentLocation.value.distance(from: CLLocation(latitude: lhs.coordinates.latitude, longitude: lhs.coordinates.longitude)) < self.currentLocation.value.distance(from: CLLocation(latitude: rhs.coordinates.latitude, longitude: rhs.coordinates.longitude))
            })
        }).disposed(by: disposeBag)
        
    }

    func cityInformationUpdated(cityInformationList: [CityInformation]) {
        self.cityInformationList.value = cityInformationList.sorted(by: { lhs, rhs -> Bool in
            return self.currentLocation.value.distance(from: CLLocation(latitude: lhs.coordinates.latitude, longitude: lhs.coordinates.longitude)) < self.currentLocation.value.distance(from: CLLocation(latitude: rhs.coordinates.latitude, longitude: rhs.coordinates.longitude))
        })
    }
    
    func locationUpdated(location: CLLocation) {
        self.currentLocation.value = location
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

