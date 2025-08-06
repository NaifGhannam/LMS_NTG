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
    
    // MARK: - Static data (mocked)
    let GradeSubject = ["Grade 10 - Math", "Grade 11 - Biology", "Grade 12 - Physics"]
    let examType = ["Midterm", "Final"]

    // MARK: - Input fields (binded with View)
    @Published var selectedGradeSubject: String = "Grade 10 - Math"
    @Published var selectedExamType: String = "Midterm"
    
    @Published var duration: String = ""
    @Published var Weightage: String = ""
    @Published var room: String = ""
    
    @Published var date: Date = Date()
    @Published var time: Date = Date()
    
    // MARK: - Feedback
    @Published var message: String?
    @Published var isSuccess: Bool = false
    
    private let examService: ExamServiceProtocol
    
    // MARK: - Init
    init(examService: ExamServiceProtocol = ExamService()) {
        self.examService = examService
    }

    // MARK: - Add Exam Function
    func addExam() async {
        guard let weight = Int(Weightage),
              let durationInt = Int(duration) else {
            message = "Weightage and duration must be valid numbers."
            isSuccess = false
            return
        }

        // convert to required strings
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let examDate = dateFormatter.string(from: date)
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm:ss"
        let startTime = timeFormatter.string(from: time)
        
        // Simple end time logic (add duration)
        guard let endTimeDate = Calendar.current.date(byAdding: .minute, value: durationInt, to: time) else {
            message = "Invalid time calculation"
            isSuccess = false
            return
        }
        let endTime = timeFormatter.string(from: endTimeDate)

        // Assume gradeSubjectId is extracted from the name (in real app, it should come from backend)
        let gradeSubjectId = getGradeSubjectId(from: selectedGradeSubject)
        
        let gradeSubject = LMS_NTG_Project.GradeSubject(gradeSubjectId: gradeSubjectId)
        
        do {
            let response = try await examService.requestExam(
                gradeSubject: gradeSubject,
                examName: selectedGradeSubject,
                examDate: examDate,
                startTime: startTime,
                endTime: endTime,
                maxDegree: weight,
                successDegree: weight / 2,
                type: selectedExamType
            )
            
            message = response.message
            isSuccess = response.status.lowercased() == "success"
        } catch {
            message = error.localizedDescription
            isSuccess = false
        }
    }

    // Mock method to simulate ID extraction
    private func getGradeSubjectId(from name: String) -> Int {
        switch name {
        case "Grade 10 - Math": return 1
        case "Grade 11 - Biology": return 2
        case "Grade 12 - Physics": return 3
        default: return 0
        }
    }
}
