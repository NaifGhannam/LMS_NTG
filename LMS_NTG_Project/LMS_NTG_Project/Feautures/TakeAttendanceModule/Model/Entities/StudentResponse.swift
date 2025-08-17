//
//  StudentResponse.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 23/02/1447 AH.
//

import Foundation

struct StudentResponse: Codable, Identifiable {
    
    let studentId: Int
    let user: Users
    let grade: Grades
    let studentClass: SchoolClass
    
    var id: Int { studentId }
}
