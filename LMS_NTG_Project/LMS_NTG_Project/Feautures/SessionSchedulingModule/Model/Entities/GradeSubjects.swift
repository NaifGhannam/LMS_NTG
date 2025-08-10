//
//  SessionResponse.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 11/02/1447 AH.
//

import Foundation

struct GradeSubjects: Identifiable, Hashable, Codable {
    
    var id: Int { gradeSubjectId }
    let gradeSubjectId: Int
    let grade: Grades
    let subject: Subjects
    let teacher: Teachers
}
