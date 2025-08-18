//
//  TakeAttendanceRequest.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 24/02/1447 AH.
//

import Foundation

struct TakeAttendanceRequest: Codable, Identifiable {
    
    let attendanceId: Int
    let studentId: Int
    let status: String
    let notes: String?
    
    var id: Int { attendanceId }
}
