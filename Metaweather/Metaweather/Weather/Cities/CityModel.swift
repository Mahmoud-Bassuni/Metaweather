//
//  CityModel.swift
//  Metaweather
//
//  Created by Bassuni on 18/06/2021.
//

import Foundation

struct CityModel {
    let name: String
    let id: String
}

struct CityUIModel {
    var name: String
    var id: String
    
    init(city: CityModel) {
        id = city.id
        name = city.name
    }
}
