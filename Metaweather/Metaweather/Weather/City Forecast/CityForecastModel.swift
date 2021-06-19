//
//  CityForecastModel.swift
//  Metaweather
//
//  Created by Bassuni on 18/06/2021.
//

import Foundation

struct CityForecastModel {
    let id: Int
    let weatherStateName, weatherStateAbbr, windDirectionCompass, created: String
    let applicableDate: String
    let minTemp, maxTemp, theTemp, windSpeed: Double
    let windDirection, airPressure: Double
    let humidity: Int
    let visibility: Double
    let predictability: Int
    let imageURL: String
    
    init(consolidatedWeather: ConsolidatedWeather) {
        id = consolidatedWeather.id
        weatherStateName = consolidatedWeather.weatherStateName
        weatherStateAbbr = consolidatedWeather.weatherStateAbbr
        windDirectionCompass = consolidatedWeather.windDirectionCompass
        created = consolidatedWeather.created
        applicableDate = consolidatedWeather.applicableDate.getDate(format: "yyyy-MM-dd")?.getDay() ?? consolidatedWeather.applicableDate
        minTemp = consolidatedWeather.minTemp
        maxTemp = consolidatedWeather.maxTemp
        theTemp = consolidatedWeather.theTemp
        windSpeed = consolidatedWeather.windSpeed
        windDirection = consolidatedWeather.windDirection
        airPressure = consolidatedWeather.airPressure
        humidity = consolidatedWeather.humidity
        visibility = consolidatedWeather.visibility
        predictability = consolidatedWeather.predictability
        imageURL = "\(Config().hostURL)/static/img/weather/\(consolidatedWeather.weatherStateAbbr).svg"
    }
}
