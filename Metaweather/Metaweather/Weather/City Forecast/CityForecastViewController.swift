//
//  CityForecast.swift
//  Metaweather
//
//  Created by Bassuni on 18/06/2021.
//

import UIKit
import RxSwift
import RxCocoa
import SVProgressHUD

class CityForecastViewController: UIViewController {
    
    @IBOutlet weak var forecastDaysTableView: UITableView!
    
    let disposeBag = DisposeBag()
    var viewModel: CityForecastViewModel!
    var cityName: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = cityName
        forecastDaysTableView.tableFooterView = UIView() // ui of table
        viewModelConfig()
        setupTableViewDataSource()
        setupTableViewDelegate()
    }
    
    func setupTableViewDataSource() {
        viewModel.getCityForecastInfo()
        viewModel.forecastInfo.compactMap{$0}.bind(to: forecastDaysTableView!.rx.items) { tableView, index, element in
            let cell = UITableViewCell()
            cell.textLabel?.text = element?.applicableDate
            return cell
        }.disposed(by: disposeBag)
    }
    
    func setupTableViewDelegate() {
        forecastDaysTableView!.rx
            .modelSelected(CityUIModel.self)
            .subscribe(onNext: { [weak self] city in
                self?.viewModel.coordinator?.cityForecast(city: city)
            })
            .disposed(by: disposeBag)
    }
    
    func viewModelConfig() {
        viewModel.isLoading.bind(to: self.rx.showLoader).disposed(by: disposeBag)

        viewModel.apiError.observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] (error) in
                self?.alert(title: "error", message: error?.errorMessage ?? "")
            }).disposed(by: disposeBag)
    }
}


