//
//  ExamService.swift
//  LMS_NTG_Project
//
//  Created by Naif on 10/02/1447 AH.
//

import Foundation

struct ExamService  : ExamServiceProtocol{
    func requestExam(gradeSubject: GradeSubject,
        examName: String
    , examDate: String
    , startTime: String
    , endTime: String
    , maxDegree: Int
    , successDegree: Int
    , type: String) async throws -> ExamResponse {
        
        let request = ExamRequest(
             examName: examName
            , examDate: examDate
            , startTime: startTime
            , endTime: endTime
            , maxDegree: maxDegree
            , successDegree: successDegree
            , type: type
               )
        return try await NetworkManager.shared.request(
            endpoint: .requestExam,
            body: request
        )
            
        }
}
