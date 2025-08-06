//
//  ExamProtocol.swift
//  LMS_NTG_Project
//
//  Created by Naif on 10/02/1447 AH.
//

import Foundation

protocol ExamServiceProtocol {
    func requestExam(gradeSubject: GradeSubject, examName: String
                     , examDate: String
                     , startTime: String
                     , endTime: String
                     , maxDegree: Int
                     , successDegree: Int
                     , type: String) async throws -> ExamResponse
}
