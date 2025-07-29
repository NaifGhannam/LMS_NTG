//
//  APIEndpoint.swift
//  LMS_NTG_Project
//
//  Created by NTG on 28/07/2025.
//

import Foundation

enum APIEndpoint {
    case login
//    case updateProfile(id: Int)
    case requestReset

    var baseURL: String {
        return "https://lmsendpoints-production.up.railway.app/"
    }

    var path: String {
        switch self {
        case .login:
            return "api/v1/accounts/login"
        
//        case .updateProfile(let id):
//            return "/users/\(id)"
            
        case .requestReset:
            return "api/v1/accounts/request-reset"
        
        }
    }

    var method: HTTPMethod {
        switch self {
        case .login: return .post
//        case .updateProfile: return .put
            
        case .requestReset:
            return .post
        }
    }

    var url: String {
        return baseURL + path
    }
}
