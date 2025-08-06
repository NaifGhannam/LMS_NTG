//
//  Exam.swift
//  LMS_NTG_Project
//
//  Created by Naif on 10/02/1447 AH.
//

import Foundation

struct ExamRequest: Codable {
 

    var gradeSubject: GradeSubject
    var examName: String
    var examDate: String
    var startTime: String
    var endTime: String
    var maxDegree: Int
    var successDegree: Int
    var type: String
}
struct GradeSubject: Codable {
    var gradeSubjectId: Int
}
