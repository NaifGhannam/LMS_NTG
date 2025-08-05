//
//  ExamService.swift
//  LMS_NTG_Project
//
//  Created by Naif on 10/02/1447 AH.
//

import Foundation

struct ExamService  : ExamServiceProtocol{
    func requestExam(name: String, date: Date, time: Date, weightage: Int?, room: String?, duration: Int, ExamType: String) async throws -> ExamResponse {
        
        let request = ExamRequest(
                   name: name,
                   date: date,
                   time: time,
                   weightage: 20,
                   room: "A101",
                   examType: "Midterm"
               )
        return try await NetworkManager.shared.request(
            endpoint: .requestExam,
            body: request
        )
            
        }
}
