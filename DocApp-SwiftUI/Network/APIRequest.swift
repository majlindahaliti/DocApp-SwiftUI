//
//  APIConfiguraiton.swift
//  DocApp-SwiftUI
//
//  Created by Majlinda on 13.4.25.
//

import Foundation
import Alamofire

protocol APIRequest {
    associatedtype Response: Decodable
    
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var headers: HTTPHeaders? { get }
    var encoding: ParameterEncoding { get }
}

extension APIRequest {
    var headers: HTTPHeaders? { nil }
    var parameters: Parameters? { nil }
    var encoding: ParameterEncoding {
        method == .get ? URLEncoding.default : JSONEncoding.default
    }
}

