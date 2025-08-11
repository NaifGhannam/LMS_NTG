//
//  Exam.swift
//  LMS_NTG_Project
//
//  Created by Naif on 10/02/1447 AH.
//

struct ExamRequest: Codable {
    let gradeSubject: GradeSubjectIdWrapper
    let examName: String
    let examDate: String
    let startTime: String
    let endTime: String
    let maxDegree: Int
    let successDegree: Int
    let type: String
}

struct GradeSubjectIdWrapper: Codable {
    let gradeSubjectId: Int
}
