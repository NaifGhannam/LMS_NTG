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
    
    // MARK: - Input fields
    @Published var selectedDate: Date? = nil
    @Published var selectedTimeStart: Date? = nil
    @Published var selectedTimeEnd: Date? = nil
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

    // MARK: - Services
    private let examService: ExamServiceProtocol

    init(examService: ExamServiceProtocol = ExamService()) {
        self.examService = examService
    }

    // MARK: - Add Exam Function
    func submitExam(selectedGradeSubject: GradeSubject?, selectedExamType: ExamType?) async {
        guard let gradeSubject = selectedGradeSubject,
              let examType = selectedExamType else {
            message = "Please fill all fields"
            return
        }

        guard let examDate = selectedDate,
              let start = selectedTimeStart,
              let end = selectedTimeEnd else {
            message = "Please select date and time"
            return
        }

        guard let max = Int(Max_Degree),
              let success = Int(successDegree) else {
            message = "Invalid degrees"
            return
        }

        // Format date and time
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm:ss"

        do {
            let response = try await examService.requestExam(
                gradeSubject: gradeSubject,
                examName: examName,
                examDate: dateFormatter.string(from: examDate),
                startTime: timeFormatter.string(from: start),
                endTime: timeFormatter.string(from: end),
                maxDegree: max,
                successDegree: success,
                type: examType.rawValue
            )
            message = response.message
            isSuccess = true
        } catch {
            message = "Failed to schedule exam: \(error.localizedDescription)"
            isSuccess = false
        }
    }
}
