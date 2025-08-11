//
//  SchoolClass.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 13/02/1447 AH.
//

import Foundation

struct SchoolClass: Identifiable, Hashable, Codable {
    
    var id: Int { classId }
    let classId: Int
    let className: String
    let grade: Grades
}
