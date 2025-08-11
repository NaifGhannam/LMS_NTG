//
//  Grades.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 13/02/1447 AH.
//

import Foundation

struct Grades: Identifiable, Hashable, Codable {
    
    var id: Int { gradeId }
    let gradeId: Int
    let gradeName: String
}
