//
//  Date+Extension.swift
//  Metaweather
//
//  Created by Bassuni on 19/06/2021.
//

import Foundation

extension Date {
    
    func getDay()-> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "cccc"
        return dateFormatter.string(from: self)
    }
}
