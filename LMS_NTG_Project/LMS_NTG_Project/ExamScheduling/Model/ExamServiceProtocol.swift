//
//  ExamProtocol.swift
//  LMS_NTG_Project
//
//  Created by Naif on 10/02/1447 AH.
//

import Foundation

protocol ExamServiceProtocol {
    func requestExam(name: String, date: Date, time: Date,weightage : Int? , room: String?, duration: Int ,ExamType : String) async throws -> ExamResponse
}
