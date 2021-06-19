//
//  DayForecastDetailsViewModel.swift
//  Metaweather
//
//  Created by Bassuni on 19/06/2021.
//

import Foundation

class DayForecastDetailsViewModel {
  
    private(set) var forecastInfoDetails: CityForecastModel?
    
    init(model: CityForecastModel) {
        forecastInfoDetails = model
    }
}
