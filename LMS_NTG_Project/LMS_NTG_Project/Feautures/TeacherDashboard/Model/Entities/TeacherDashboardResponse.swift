//
//  TeacherDashboardResponse.swift
//  LMS_NTG_Project
//
//  Created by Naif on 24/02/1447 AH.
//


import Foundation

// MARK: - Dashboard Response
struct TeacherDashboardResponse: Codable {
    let data: DashboardData
    let message: String
    let status: String
    let timestamp: String
}

struct DashboardData: Codable {
    let classPerformance: [ClassPerformance]
    let studentsCount: Int
    let subjectsCount: Int
    let teacher: [Teacher]
    let assignmentsCount: Int
    let teacherTodayClasses: [TeacherTodayClass]
    let pendingAssignments: [PendingAssignment]
    let classNotes: [ClassNote]
}

// MARK: - Class Performance
struct ClassPerformance: Codable, Identifiable {
    let id = UUID()
    let performanceScore: Double
    let className: String
    let classId: Int
    
    enum CodingKeys: String, CodingKey {
        case performanceScore = "performance_score"
        case className = "class_name"
        case classId = "class_id"
    }
}

// MARK: - Teacher
struct Teacher: Codable, Identifiable {
    let id = UUID()
    let firstName: String
    let gender: String
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case gender
    }
}

// MARK: - Today Classes
struct TeacherTodayClass: Codable, Identifiable {
    let id = UUID()
    let grade: String
    let studentCount: Int
    let sessionId: Int
    let startTime: String
    let endTime: String
    let className: String
    let status: String
    let location: String
    
    enum CodingKeys: String, CodingKey {
        case grade
        case studentCount = "student_count"
        case sessionId = "session_id"
        case startTime = "start_time"
        case endTime = "end_time"
        case className = "class"
        case status
        case location
    }
}

// MARK: - Pending Assignment
struct PendingAssignment: Codable, Identifiable {
    let id = UUID()
    let studentName: String
    let submitAt: String?
    let maxScore: Int
    let title: String
    let subtitle: String?
    let description: String?
    let deadline: String
    let submissionId: Int
    let assignmentId: Int
    let status: String
    let studentId: Int
    let submissionStatus: String
    
    enum CodingKeys: String, CodingKey {
        case studentName = "student_name"
        case submitAt = "submit_at"
        case maxScore = "max_score"
        case title, subtitle, description, deadline
        case submissionId = "submission_id"
        case assignmentId = "assignment_id"
        case status
        case studentId = "student_id"
        case submissionStatus = "submission_status"
    }
}

// MARK: - Class Notes
struct ClassNote: Codable, Identifiable {
    let id = UUID()
    let performanceCategory: String
    let className: String
    let gradeName: String
    let percentage: Double
    let classId: Int
    
    enum CodingKeys: String, CodingKey {
        case performanceCategory = "performance_category"
        case className = "class_name"
        case gradeName = "grade_name"
        case percentage
        case classId = "class_id"
    }
}
import SwiftUI

struct ToDayClass: Identifiable {
    var id = UUID()
    var name: String
    var time: String
    var status: ClassStatus
    var room: String
}
extension TeacherTodayClass {
    func toUIModel() -> ToDayClass {
        let statusEnum = ClassStatus(rawValue: self.status) ?? .coming
        return ToDayClass(
            name: "\(grade) - \(className)",
            time: "\(startTime) - \(endTime)",
            status: statusEnum,
            room: "\(location) | \(studentCount) Students"
        )
    }
}
