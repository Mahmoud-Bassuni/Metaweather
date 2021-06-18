//
//  CitiesViewModel.swift
//  Metaweather
//
//  Created by Bassuni on 18/06/2021.
//

import Foundation
import RxSwift
import RxCocoa

class CitiesViewModel {
   
    private(set) var cities = BehaviorRelay<[CityUIModel?]>(value: [])
    weak var coordinator: CityCoordinator?
    
    init() {
        cities.accept([CityUIModel(city: CityModel(name: City.sofia.rawValue, id: City.sofia.id)),
                       CityUIModel(city: CityModel(name: City.ny.rawValue, id: City.ny.id)),
                       CityUIModel(city: CityModel(name: City.tokyo.rawValue, id: City.tokyo.id))])
    }
}
