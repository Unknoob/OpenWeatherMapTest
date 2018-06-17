//
//  FirstViewController.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 13/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ListViewController: UIViewController, ListViewControllerProtocol {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: ListPresenterProtocol!
    var cityInformationList: Variable<[CityInformation]> = Variable([])
    var selectedUnit: Variable<TemperatureUnit> = Variable(.celsius)
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityInformationList.asObservable().bind(to: tableView.rx.items(cellIdentifier: "ListTableViewCell", cellType: ListTableViewCell.self)) { (_, cityInformation: CityInformation, cell: ListTableViewCell) in
            cell.fill(withCityInformation: cityInformation, andUnit: self.selectedUnit.value)
            self.selectedUnit.asObservable().subscribe({ (temperature) in
                cell.selectedUnit.value = temperature.element!
            }).disposed(by: cell.disposeBag)
            
        }.disposed(by: disposeBag)
        
    }

    func updateCityInformation(cityInformationList: [CityInformation]) {
        self.cityInformationList.value = cityInformationList
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

