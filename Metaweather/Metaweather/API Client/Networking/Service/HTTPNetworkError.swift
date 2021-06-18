//
//  HTTPNetworkError.swift
//  Metaweather
//
//  Created by Bassuni on 18/06/2021.
//

import Foundation

enum HTTPNetworkError: Error {
    case success
    case badRequest(String?)
    case noInternetConnection
    case unableToDecode
    case serverSideError
    case noData
    case other(String)
    
    var errorMessage: String {
        switch self {
        case .success:
            return "Successful Network Request"
        case .badRequest(let errorData):
            return errorData ?? ""
        case .noInternetConnection:
            return "No Internet Connection"
        case .unableToDecode:
            return "Unable To Decode"
        case .serverSideError:
            return "error from server"
        case .noData:
            return "there is no data"
        case .other(let message):
            return message
        }
    }
}
