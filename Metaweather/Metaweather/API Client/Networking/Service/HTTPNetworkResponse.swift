//
//  HTTPNetworkResponse.swift
//  Metaweather
//
//  Created by Bassuni on 18/06/2021.
//

import Foundation

struct HTTPNetworkResponse {
    static func handleNetworkResponse(for response: HTTPURLResponse, data: Data?) -> HTTPNetworkError {
        switch response.statusCode {
        case 200...299:
            return .success
        case URLError.Code.notConnectedToInternet.rawValue, URLError.Code.networkConnectionLost.rawValue:
            return .noInternetConnection
        case 400...500:
            return HTTPNetworkError.badRequest("Bad request")
        case 501...599:
            return HTTPNetworkError.serverSideError
        default:
            return HTTPNetworkError.other("unknow error")
        }
    }
}
