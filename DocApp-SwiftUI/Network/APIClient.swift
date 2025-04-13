//
//  APIClient.swift
//  DocApp-SwiftUI
//
//  Created by Majlinda on 13.4.25.
//

import Foundation
import Alamofire
import Combine

class APIClient {
    static let shared = APIClient()
    private let baseURL = APIConstants.DevelopmentServer.baseURL

    private init() {}

    func request<T: APIRequest>(_ request: T) -> AnyPublisher<T.Response, APIError> {
        let url = "\(baseURL)\(request.path)"
        
        return Future<T.Response, APIError> { promise in
            AF.request(
                url,
                method: request.method,
                parameters: request.parameters,
                encoding: request.encoding,
                headers: request.headers
            )
            .validate()
            .responseDecodable(of: T.Response.self) { response in
                switch response.result {
                case .success(let decoded):
                    promise(.success(decoded))
                case .failure(let error):
                    if let data = response.data,
                       let serverMessage = String(data: data, encoding: .utf8) {
                        promise(.failure(.serverError(serverMessage)))
                    } else {
                        let networkError = error.isSessionTaskError ? "No internet connection." : error.localizedDescription
                        promise(.failure(.networkError(networkError)))
                    }
                }
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
