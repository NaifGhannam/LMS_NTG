//
//  ExamType.swift
//  LMS_NTG_Project
//
//  Created by Naif on 12/02/1447 AH.
//



enum ExamType: String, CaseIterable, Identifiable {
    case Midterm,Monthly, Final , Quiz
    
    var id: Self { self }
}
