//
//  SessionRequest.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 11/02/1447 AH.
//

import Foundation

struct SessionRequest: Codable {
    
    var classEntity: ClassEntity
    var gradeSubject: GradesSubject
    var sessionDate: String
    var sessionNumber: Int
    var type: String
    var status: String
}

struct ClassEntity: Codable {
    var classId: Int
}

struct GradesSubject: Codable {
    var gradeSubjectId: Int
}
