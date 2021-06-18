//
//  Encodable+toDictionary.swift
//  Metaweather
//
//  Created by Bassuni on 18/06/2021.
//


import Foundation

extension Encodable {
    func toDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else { return [:] }
        let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)

        return jsonObject.flatMap { $0 as? [String: Any] } ?? [:]
    }

    func toData() -> Data? {
        try? JSONSerialization.data(withJSONObject: self.toDictionary(), options: .prettyPrinted)
    }
}
