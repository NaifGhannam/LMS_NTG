//
//  SessionService.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 11/02/1447 AH.
//

import Foundation

struct SessionService: SessionServiceProtocol {
    
    func sessionScheduling(classEntity: ClassEntity, gradeSubject: GradesSubject, sessionDate: String, sessionNumber: Int, type: String, status: String) async throws -> SessionResponse {
        
        let request = SessionRequest(classEntity: classEntity, gradeSubject: gradeSubject, sessionDate: sessionDate, sessionNumber: sessionNumber, type: type, status: status)
        
        return try await NetworkManager.shared.request(endpoint: .sessionScheduling, body: request)
    }
    
    func getGradeSubjects() async throws -> [GradeSubjects] {
        return try await NetworkManager.shared.request(endpoint: .gradeSubjects)
    }
    
    func getAllClasses() async throws -> [SchoolClass] {
        return try await NetworkManager.shared.request(endpoint: .allClasses)
    }
}
