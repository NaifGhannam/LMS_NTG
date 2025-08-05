//
//  ExamSchedulingViewModel.swift
//  LMS_NTG_Project
//
//  Created by Naif on 10/02/1447 AH.
//

import Foundation


@MainActor
class ExamSchedulingViewModel: ObservableObject {
    
    var GradeSubject = ["Grade 10 - Math", "Grade 11 - Biology", "Grade 12 - Physics"]
    @Published  var selectedGradeSubject = "Grade 10 - Math"
    @Published  var duration = ""
    @Published  var Weightage = ""
    @Published  var room = ""
    @Published  var date = Date()
    @Published  var time = Date()
    @Published  var examType = ["midterm", "final","Quiz"]
    @Published  var selectedExamType = "midterm"
    
    @Published var exam : ExamResponse?

    
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let examService : ExamServiceProtocol
    
    init(examService: ExamServiceProtocol = ExamService()) {
            self.examService = examService
        }
    func addExam() async {
        isLoading = true
        errorMessage = nil
        do {
            let result = try await examService.requestExam(name: selectedGradeSubject, date: date, time: time, weightage: Int(Weightage) ?? 0, room: room, duration: Int(duration) ?? 0, ExamType: selectedExamType)
            self.exam = result
            isLoading = false
        }catch {
            self.errorMessage = error.localizedDescription
            isLoading = false
        }
    }
}

