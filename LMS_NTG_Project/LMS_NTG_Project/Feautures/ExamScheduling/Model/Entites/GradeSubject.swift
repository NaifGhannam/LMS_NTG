//
//  GradeSubjectTeacher.swift
//  LMS_NTG_Project
//
//  Created by Naif on 12/02/1447 AH.
//


struct GradeSubject: Identifiable, Hashable {
    let id: Int
    let name: String
}


extension GradeSubject {
    static let all: [GradeSubject] = [
        GradeSubject(id: 1, name: "Grade 10 - Math"),
        GradeSubject(id: 2, name: "Grade 11 - Biology"),
        GradeSubject(id: 3, name: "Grade 12 - Physics")
    ]
}
