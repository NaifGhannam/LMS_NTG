//
//  TakeAttendanceResponse.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 24/02/1447 AH.
//

import Foundation

struct TakeAttendanceResponse: Codable {
    //let data: [StudentAttendanceRecord]
    let message: String
    let status: String
    let timestamp: String
}

// MARK: - Student Attendance Record
struct StudentAttendanceRecord: Codable, Identifiable {
    let studentAttendanceId: Int
    let attendance: AttendanceResponse
    let student: StudentResponse
    let status: String
    let notes: String?
    
    var id: Int { studentAttendanceId }
}
