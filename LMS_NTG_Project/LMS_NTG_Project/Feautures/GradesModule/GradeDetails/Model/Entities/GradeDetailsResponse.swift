//
//  GradeDetailsResponse.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 19/02/1447 AH.
//

import Foundation

struct GradeDetailsResponse: Identifiable, Codable {

    var id: String { "\(subjectID)-\(degreeID)-\(type)" }
    let subjectID: Int
    let subjectName: String
    let degree: Int
    let degreeID: Int
    let type: String
    let value: String
    
    enum CodingKeys: String, CodingKey {
        case subjectID = "subject_id"
        case subjectName = "subject_name"
        case degree
        case degreeID = "degree_id"
        case type
        case value
    }
}
