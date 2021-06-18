//
//  CityEnum.swift
//  Metaweather
//
//  Created by Bassuni on 18/06/2021.
//

import Foundation
enum City: String {
    case sofia = "Sofia"
    case ny = "NY"
    case tokyo = "Tokyo"
    
    var id: String {
        switch self {
        case .sofia: return "839722"
        case .ny: return "839722"
        case .tokyo: return "839722"
        }
    }
    
}

