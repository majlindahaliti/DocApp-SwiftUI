//
//  APIError.swift
//  DocApp-SwiftUI
//
//  Created by Majlinda on 13.4.25.
//

import Foundation

enum APIError: Error, LocalizedError {
    case unknown
    case decodingError
    case serverError(String)
    case networkError(String)
    
    var errorDescription: String? {
        switch self {
        case .unknown:
            return "An unknown error occurred."
        case .decodingError:
            return "Failed to decode the response."
        case .serverError(let message), .networkError(let message):
            return message
        }
    }
}
