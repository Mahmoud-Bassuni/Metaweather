//
//  MovieCoordinator.swift
//  Metaweather
//
//  Created by Bassuni on 18/06/2021.
//


import Foundation
import UIKit

class WeatherCoordinator: Coordinator   {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc : CitiesViewController = .instantiate(storyboard: "Weather")
        let viewModel = CitiesViewModel()
        viewModel.coordinator = self
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: false)
    }
    
    func cityForecast(city: CityUIModel) {
        let vc : CityForecastViewController = .instantiate(storyboard: "Weather")
        let networkClient = NetworkClient(baseUrl: Config().baseURL)
        let viewModel = CityForecastViewModel(apiClient: WeatherAPI(networkClient: networkClient), cityId: city.id)
        viewModel.coordinator = self
        vc.viewModel = viewModel
        vc.cityName = city.name
        navigationController.pushViewController(vc, animated: false)
    }
    
    func dayForecastDetails(model: CityForecastModel) {
        let vc : DayForecastDetailsViewController = .instantiate(storyboard: "Weather")
        let viewModel = DayForecastDetailsViewModel(model: model)
        vc.viewModel = viewModel
        vc.dayName = model.applicableDate
        navigationController.pushViewController(vc, animated: false)
    }
    
    deinit {
        print("WeatherCoordinator ---> deinit")
    }
}
