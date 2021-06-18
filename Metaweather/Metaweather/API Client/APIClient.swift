//
//  APIClient.swift
//  Metaweather
//
//  Created by Bassuni on 18/06/2021.
//

import Foundation

protocol APIClient {
    var networkClient: NetworkClientType { get }
}
