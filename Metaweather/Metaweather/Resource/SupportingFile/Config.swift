//
//  Config.swift
//  Metaweather
//
//  Created by Bassuni on 18/06/2021.
//


import Foundation

public struct Config {
    private var properties: [String: String] = [:]
    public var hostURL: String {
        return "https://" + (properties["HOST_URL"] ?? "")
    }
    
    public var baseURL: String {
        return "https://" + (properties["BASE_URL"] ?? "")
    }
    
    public init() {
        for (key, value) in (Bundle.main.infoDictionary) ?? [:] {
            properties[key] = value as? String ?? ""
        }
    }
}
