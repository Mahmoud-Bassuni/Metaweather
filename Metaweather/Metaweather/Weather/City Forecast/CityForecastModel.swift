//
//  CityForecastModel.swift
//  Metaweather
//
//  Created by Bassuni on 18/06/2021.
//

import Foundation

struct CityForecastModel {
    let id: Int
    let weatherStateName, weatherStateAbbr, windDirectionCompass, applicableDate, created: String
    let humidity, visibility, airPressure: String
    let imageURL, minTemp, maxTemp, theTemp: String
    
    init(consolidatedWeather: ConsolidatedWeather) {
        id = consolidatedWeather.id
        weatherStateName = consolidatedWeather.weatherStateName
        weatherStateAbbr = consolidatedWeather.weatherStateAbbr
        windDirectionCompass = consolidatedWeather.windDirectionCompass
        created = consolidatedWeather.created
        applicableDate = consolidatedWeather.applicableDate.getDate(format: "yyyy-MM-dd")?.getDay() ?? consolidatedWeather.applicableDate
        minTemp = "min: \(String(format: "%.0f", consolidatedWeather.minTemp))°C"
        maxTemp = "Max: \(String(format: "%.0f", consolidatedWeather.maxTemp))°C"
        theTemp = "\(String(format: "%.0f", consolidatedWeather.theTemp))°C"
        airPressure = "\(consolidatedWeather.airPressure)"
        humidity = "\(consolidatedWeather.humidity)"
        visibility = "\(consolidatedWeather.visibility)"
        imageURL = "\(Config().hostURL)/static/img/weather/png/\(consolidatedWeather.weatherStateAbbr).png"
    }
}
