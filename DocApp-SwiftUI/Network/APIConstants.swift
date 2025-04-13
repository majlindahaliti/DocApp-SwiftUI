//
//  APIConstants.swift
//  DocApp-SwiftUI
//
//  Created by Majlinda on 13.4.25.
//

import Foundation

struct APIConstants {
    struct DevelopmentServer {
        static let baseURL = "https://mocki.io/v1"
    }
}

enum HTTPHeaderField: String {
    case contentType = "Content-Type"
    case acceptType = "Accept"
}

enum ContentType: String {
    case json = "application/json"
}
