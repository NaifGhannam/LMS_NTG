//
//  ExamSchedulingViewModel.swift
//  LMS_NTG_Project
//
//  Created by Naif on 10/02/1447 AH.
//
import Foundation
import SwiftUI

@MainActor
class ExamSchedulingViewModel: ObservableObject {
    
   
    @Published  var selectedDate: Date? = nil
    @Published  var selectedTimeStart: Date? = nil
    @Published  var selectedTimeEnd: Date? = nil

    // MARK: - Input fields (binded with View)
    @Published var selectedGradeSubject: String = ""
    @Published var selectedExamType: String = ""
    
    
    @Published var examName: String = ""
    @Published var Max_Degree: String = ""
    @Published var successDegree: String = ""
    @Published var room: String = ""
    
    @Published var date: Date = Date()
    // MARK: - Feedback
    @Published var message: String?
    @Published var isSuccess: Bool = false
    
    
    

    // MARK: - Add Exam Function

  
}
