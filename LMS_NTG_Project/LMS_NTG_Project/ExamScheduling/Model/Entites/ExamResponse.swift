//
//  ExamRequest 2.swift
//  LMS_NTG_Project
//
//  Created by Naif on 10/02/1447 AH.
//



import Foundation

struct ExamResponse : Codable {
    var name: String?
    var date: Date?
    var time: Date?
    var weightage: Int?
    var room : String?
    var examType : String?
    var duration : Int?
    
}
