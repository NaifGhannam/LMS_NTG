//
//  NetworkError.swift
//  LMS_NTG_Project
//
//  Created by NTG on 28/07/2025.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case requestFailed(Int)
    case decodingFailed
    case unknown
    case custom(String)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL."
        case .requestFailed(let statusCode):
            return "Request failed with status code \(statusCode)."
        case .decodingFailed:
            return "Failed to decode response."
        case .unknown:
            return "An unknown error occurred."
        case .custom(let message):
            return message
        }
    }
}
