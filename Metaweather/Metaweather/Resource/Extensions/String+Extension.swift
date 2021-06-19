//
//  Date+Extension.swift
//  Metaweather
//
//  Created by Bassuni on 19/06/2021.
//

import Foundation

extension String {
    func getDate(format: String) -> Date? {
        let dateformater = DateFormatter()
        dateformater.locale = Locale(identifier: "en_US_POSIX")
        dateformater.dateFormat = format
        return dateformater.date(from: self)
    }
}
