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
    case verifyResetCode
    case resetPassword
    case getDegrees(id: Int)
    case studentInfo(id: Int)
    case getStudentsAttendances(id: Int)
    case requestExam
    
    var baseURL: String {
        return "http://196.221.167.63:8080/"
    }

    var path: String {
        switch self {
            
        case .login:
            return "api/v1/accounts/login"
        
//        case .updateProfile(let id):
//            return "/users/\(id)"
            
        case .requestReset:
            return "api/v1/accounts/request-reset"
            
        case .verifyResetCode:
            return "api/v1/accounts/verify-reset-code"
            
        case .resetPassword:
            return "api/v1/accounts/reset-password"
            
        case .getDegrees(let id):
            return "api/v1/degrees/student/\(id)"
            
        case .studentInfo(let id):
            return ""
            
        case .getStudentsAttendances(let id):
            return "/api/v1/students_attendances/\(id)"
            
        case .requestExam:
            return ""
        

        }
    }

    var method: HTTPMethod {
        switch self {
        case .login: return .post
//        case .updateProfile: return .put
            
        case .requestReset:
            return .post
            
        case .verifyResetCode:
            return .post
            
        case .resetPassword:
            return .post
            
        case .getDegrees:
            return .get

        
        case .studentInfo:
            return .get
            
        case .getStudentsAttendances:
            return .get
            
        case .requestExam:
            return .post 
        }
    }

    var url: String {
        return baseURL + path
    }
}
