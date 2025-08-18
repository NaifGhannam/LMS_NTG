//
//  TakeAttendanceService.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 23/02/1447 AH.
//

import Foundation

struct TakeAttendanceService: TakeAttendanceServiceProtocol {
    
    func getStudent(id: Int) async throws -> [StudentResponse] {
        
        return try await NetworkManager.shared.request(endpoint: .getStudent(id: id))
    }
    
    func getAttendanceSession(id: Int) async throws -> [AttendanceResponse] {
        
        return try await NetworkManager.shared.request(endpoint: .getTeacherEntity(id: id))
    }
    
    func takeAttendance(attendanceId: Int, studentId: Int, status: String, notes: String) async throws -> TakeAttendanceResponse {
        
        let request = TakeAttendanceRequest(attendanceId: attendanceId, studentId: studentId, status: status, notes: notes)
        
        return try await NetworkManager.shared.request(endpoint: .takeAttendance, body: [request])
    }
}
