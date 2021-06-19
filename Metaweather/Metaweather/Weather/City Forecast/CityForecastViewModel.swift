//
//  CityForecastViewModel.swift
//  Metaweather
//
//  Created by Bassuni on 18/06/2021.
//

import Foundation
import RxRelay
import RxSwift

class CityForecastViewModel {
    weak var coordinator: CityCoordinator?
    private let apiClient: WeatherAPIType
    let isLoading = PublishSubject<Bool>()
    let apiError = PublishSubject<HTTPNetworkError?>()
    private(set) var forecastInfo = BehaviorRelay<[ConsolidatedWeather?]>(value: [])
    private let disposeBag = DisposeBag()
    private let cityId: String
    
    init(apiClient: WeatherAPIType, cityId: String) {
        self.apiClient = apiClient
        self.cityId = cityId
    }
    
    // MARK: - Network Call
    func getCityForecastInfo() {
        isLoading.onNext(true)
        let response = apiClient.getCityForecastInfo(cityId: cityId)
        response.observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] Info in
                guard let self = self else { return }
                var consolidatedWeather : [CityForecastModel] = []
                for item in Info.consolidatedWeather {
                    consolidatedWeather.append(CityForecastModel(consolidatedWeather: item))
                }
                self.forecastInfo.accept(Info.consolidatedWeather)
                self.isLoading.onNext(false)
            }, onError: { [weak self] error in
                guard let self = self else { return }
                self.isLoading.onNext(false)
                self.apiError.onNext(error as? HTTPNetworkError)
            }).disposed(by: disposeBag)
    }
    
    func forecastInfoAtIndex(_ index: Int) -> CityForecastModel {
        let forecastInfoPerDay = forecastInfo.value[index]
        return CityForecastModel(consolidatedWeather: forecastInfoPerDay!)
    }
}
