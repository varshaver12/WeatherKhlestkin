//
//  WeatherServiceError.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 12.12.2023.
//

import Foundation

enum WeatherServiceError: Error, LocalizedError {
    
    case clientError
    case invalidStatusCode
    case noData
    case decodeError

    
    var errorDescription: String? {
        switch self {
        case .clientError:
            return "clientError"
        case .invalidStatusCode:
            return "invalidStatusCode"
        case .noData:
            return "noData"
        case .decodeError:
            return "decodeError"
        }
    }
}
