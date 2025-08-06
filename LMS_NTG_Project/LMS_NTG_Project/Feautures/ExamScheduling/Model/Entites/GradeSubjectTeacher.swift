//
//  GradeSubjectTeacher.swift
//  LMS_NTG_Project
//
//  Created by Naif on 12/02/1447 AH.
//



enum GradeSubject: String, CaseIterable, Identifiable {
    case Grade10_Math, Grade11_Biology, Grade12_Physics
    
    var id: Self { self }
}
