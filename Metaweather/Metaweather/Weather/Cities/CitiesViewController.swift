//
//  CitiesViewController.swift
//  Metaweather
//
//  Created by Bassuni on 18/06/2021.
//

import UIKit
import RxSwift
import RxCocoa

class CitiesViewController: UIViewController {
    @IBOutlet weak var citiesTableView: UITableView!
    
    let disposeBag = DisposeBag()
    var viewModel: CitiesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cities"
        citiesTableView.tableFooterView = UIView() // ui of table
        setupTableViewDataSource()
        setupTableViewDelegate()
    }
    
    func setupTableViewDataSource() {
        viewModel.cities.filter({$0.count > 0}).bind(to: citiesTableView!.rx.items) { tableView, index, element in
            let cell = UITableViewCell()
            cell.textLabel?.text = element?.name
            return cell
        }.disposed(by: disposeBag)
    }
    
    func setupTableViewDelegate() {
        citiesTableView!.rx
            .modelSelected(CityUIModel.self)
            .subscribe(onNext: { [weak self] city in
                self?.viewModel.coordinator?.cityForecast(cityId: city.id)
            })
            .disposed(by: disposeBag)
    }
}

