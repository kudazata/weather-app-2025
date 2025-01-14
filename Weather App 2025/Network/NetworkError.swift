//
//  NetworkError.swift
//  Weather App 2025
//
//  Created by Kuda Zata on 7/1/2025.
//

import Foundation

/// The different error types that might occur when making network calls
enum NetworkError: Error {
    
    case badUrl
    case badRequest
    case decodingError
    case noData
    case backendError(BackendError)
    case customError(Error)
    
    var message: String {
        switch self {
        case .badUrl:
            return String(localized: "bad_url_message")
        case .decodingError:
            return String(localized: "decoding_error_message")
        case .badRequest:
            return String(localized: "bad_request_message")
        case .noData:
            return String(localized: "no_data_message")
        case .backendError(let error):
            return error.message
        case .customError(let error):
            return error.localizedDescription
        }
    }
    
}
