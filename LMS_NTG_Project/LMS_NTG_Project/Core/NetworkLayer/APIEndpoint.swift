//
//  APIEndpoint.swift
//  LMS_NTG_Project
//
//  Created by NTG on 28/07/2025.
//

import Foundation

enum APIEndpoint {
    
    case login
    case requestReset
    case verifyResetCode
    case resetPassword
    case getDegrees(id: Int)
    case studentInfo(id: Int)
    case getStudentsAttendances(id: Int)
    case requestExam
    case sessionScheduling
    case getProfile(id: Int)
    case gradeSubjects
    case allClasses
    case changePassword
    case getGradesDetails(userId: Int, subjectId: Int)
    case getStudent(id: Int)
    case getTeacherEntity(id: Int)
    case takeAttendance
    
    var baseURL: String {
        return "http://196.221.167.63:8080/"
    }

    var path: String {
        switch self {
            
        case .login:
            return "api/v1/accounts/login"
            
        case .requestReset:
            return "api/v1/accounts/request-reset"
            
        case .verifyResetCode:
            return "api/v1/accounts/verify-reset-code"
            
        case .resetPassword:
            return "api/v1/accounts/reset-password"
            
        case .getDegrees(let id):
            return "api/v1/degrees/student/\(id)"
            
        case .studentInfo(let id):
            return "\(id)"
            
        case .getStudentsAttendances(let id):
            return "/api/v1/students_attendances/\(id)"
            
        case .requestExam:
            return "api/v1/exams"
            
        case .sessionScheduling:
            return "api/v1/sessions"
            
        case .getProfile(let id):
            return "api/v1/users/\(id)"

        case .gradeSubjects:
            return "api/v1/grade-subjects"
            
        case .allClasses:
            return "api/v1/classes/all"
            
        case .changePassword:
            return "api/v1/accounts"
            
        case .getGradesDetails(let userId, let subjectId):
            return "api/v1/degrees/subject-degree?userId=\(userId)&subjectId=\(subjectId)"
            
        case .getStudent(let id):
            return "api/v1/attendances/\(id)/students"
            
        case .getTeacherEntity(let id):
            return "api/v1/attendances/teacher-entity/\(id)"
            
        case .takeAttendance:
            return "api/v1/student_attendances/bulk"
        }
    }

    var method: HTTPMethod {
        switch self {
            
        case .login:
            return .post
            
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
            
        case .sessionScheduling:
            return .post
        
        case .getProfile:
            return .get
            
        case  .gradeSubjects:
            return .get
            
        case .allClasses:
            return .get
            
        case .changePassword:
            return .put
            
        case .getGradesDetails:
            return .get
            
        case .getStudent:
            return .get
            
        case .getTeacherEntity:
            return .get
            
        case .takeAttendance:
            return .post
        }
    }

    var url: String {
        return baseURL + path
    }
}
