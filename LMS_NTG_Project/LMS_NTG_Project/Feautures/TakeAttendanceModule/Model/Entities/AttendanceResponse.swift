//
//  AttendanceResponse.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 24/02/1447 AH.
//

import Foundation

struct AttendanceResponse: Codable, Identifiable {
    let attendanceId: Int
    let session: Sessions
    let attendDate: String
    let presents: Int
    let absences: Int
    
    var id: Int { attendanceId }
}

// MARK: - Session
struct Sessions: Codable {
    let sessionId: Int
    let classEntity: SchoolClass
    let gradeSubject: GradeSubjects
    let sessionDate: String
    let sessionNumber: Int
    let type: String
    let timeTable: TimeTable?   // can be null
    let status: String
}

// MARK: - Subject
struct Subject: Codable {
    let subjectId: Int
    let subjectName: String
}

// MARK: - Teacher
struct Teacher: Codable {
    let teacherId: Int
    let user: TeacherUser
    let specialization: String
    let yearsOfExperience: Int
    let qualification: String
}

// MARK: - TeacherUser
struct TeacherUser: Codable {
    let userId: Int
    let role: Role
    let firstName: String
    let middleName: String?
    let lastName: String
    let gender: String
    let address: String
    let birthDate: String
    let phoneNumber: String
    let photo: String?
    let nationalId: String
    let isDeleted: Bool
    let joinedOn: String
    let leftOn: String?
    let account: Accounts
}

// MARK: - TimeTable
struct TimeTable: Codable {
    let timeTableId: Int
    let classEntity: SchoolClass
    let dayOfWeek: String
    let timeSlot: TimeSlot
    let location: Location
    let gradeSubject: GradeSubjects
    let sessionType: String
}

// MARK: - TimeSlot
struct TimeSlot: Codable {
    let timeSlotId: Int
    let startTime: String
    let endTime: String
}

// MARK: - Location
struct Location: Codable {
    let locationId: Int
    let locationName: String
}
