//
//  WeatherAPI.swift
//  Metaweather
//
//  Created by Bassuni on 19/06/2021.
//

import Foundation
import RxSwift
protocol WeatherAPIType: APIClient {
    func getCityForecastInfo(cityId: String) -> PublishSubject<WeatherDetailsModel>
}

class WeatherAPI: WeatherAPIType {
    let networkClient: NetworkClientType
    
    init(networkClient: NetworkClientType) {
        self.networkClient = networkClient
    }
    
    func getCityForecastInfo(cityId: String) -> PublishSubject<WeatherDetailsModel> {
        networkClient.getRequest(path: "location/\(cityId)", parameters: [:])
    }
}
