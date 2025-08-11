//
//  ExamType.swift
//  LMS_NTG_Project
//
//  Created by Naif on 12/02/1447 AH.
//



enum ExamType: String, CaseIterable, Identifiable {
    case Midterm = "Midterm"
    ,Monthly = "Monthly"
    , Final = "Final"
    , Quiz = "Quiz"
    
    var id: Self { self }
}
