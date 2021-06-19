//
//  NetworkClient.swift
//  Metaweather
//
//  Created by Bassuni on 18/06/2021.
//
import Foundation
import RxSwift

protocol NetworkClientType {
    func getRequest<ResponseType: Decodable>(path: String, parameters: [String: String]) -> PublishSubject<ResponseType>

    func postRequest<ResponseType: Decodable>(path: String, body: Encodable) -> PublishSubject<ResponseType>

    func putRequest<ResponseType: Decodable>(path: String, body: Encodable) -> PublishSubject<ResponseType>

    func deleteRequest<ResponseType: Decodable>(path: String, parameters: [String: String]) -> PublishSubject<ResponseType>
}

class NetworkClient: NSObject, NetworkClientType {

    var task: URLSessionTask?
    let baseUrl: String
    var headers: [String: String] = [:]
    var session: URLSession?

    func getRequest<ResponseType: Decodable>(path: String, parameters: [String: String]) -> PublishSubject<ResponseType> {
        sendRequest(request: buildRequest(path: path, urlParameters: parameters ))
    }

    func postRequest<ResponseType: Decodable>(path: String, body: Encodable) -> PublishSubject<ResponseType> {
        sendRequest(request: buildRequest(path: path, httpMethod: .post, body: body))
    }

    func putRequest<ResponseType: Decodable>(path: String, body: Encodable) -> PublishSubject<ResponseType> {
        sendRequest(request: buildRequest(path: path, httpMethod: .put, body: body))
    }

    func deleteRequest<ResponseType: Decodable>(path: String, parameters: [String: String]) -> PublishSubject<ResponseType> {
        sendRequest(request: buildRequest(path: path, httpMethod: .delete, urlParameters: parameters))
    }

    func sendRequest<ResponseType: Decodable>(request: URLRequest) -> PublishSubject<ResponseType> {
        if session == nil {
            session = URLSession(configuration: .default)
        }

        let responseSubject = PublishSubject<ResponseType>()
        NetworkLogger.log(request: request)
        task = session!.dataTask(with: request, completionHandler: { data, response, error in
            if error != nil {
                if let noInternetError = error as NSError?,
                   noInternetError.code == NSURLErrorNotConnectedToInternet,
                   noInternetError.domain == NSURLErrorDomain {
                    responseSubject.onError(HTTPNetworkError.noInternetConnection)
                    NetworkLogger.log(error: error)
                    return
                }
                responseSubject.onError(HTTPNetworkError.other(error!.localizedDescription))
                NetworkLogger.log(error: error)
                return
            }

            if let response = response as? HTTPURLResponse {
                NetworkLogger.log(response: response, data: data)
                let result = HTTPNetworkResponse.handleNetworkResponse(for: response, data: data)
                switch result {
                case .success:
                    guard let responseData = data else {
                        responseSubject.onError(HTTPNetworkError.noData)
                        return
                    }
                    do {
                        let type = ResponseType.self
                        let apiResponse = try JSONDecoder().decode(type, from: responseData)
                        responseSubject.onNext(apiResponse)
                    } catch {
                        NetworkLogger.log(error: error)
                        responseSubject.onError(HTTPNetworkError.unableToDecode)
                    }
                default:
                    NetworkLogger.log(error: error)
                    responseSubject.onError(result)
                }
            }
        })
        self.task?.resume()
        return responseSubject
    }

    func buildRequest(
        path: String,
        httpMethod: HTTPMethod = .get,
        urlParameters: [String: String] = [:],
        body: Encodable? = nil
    ) -> URLRequest {

        let url = URL(string: self.baseUrl)!.appendingPathComponent(path)
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = urlParameters.map {key, value in
            URLQueryItem(name: key,
                         value: value.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed))
        }
        var request = URLRequest(url: (urlComponents?.url!)!, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60.0)
        request.httpMethod = httpMethod.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = body?.toData()

        return request
    }

    func cancel() {
        self.task?.cancel()
    }

    public init(baseUrl: String, headers: [String: String] = [:]) {
        self.baseUrl = baseUrl
        self.headers["Content-Type"] = "application/json"
        for (key, value) in headers {
            self.headers[key] = value
        }
    }
}
