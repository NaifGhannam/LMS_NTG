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
    @Published var selectedGradeSubject: GradeSubject? = nil
    @Published var selectedExamType: ExamType? = nil 
    @Published var selectedDate: Date? = nil
    @Published var selectedTimeStart: Date? = nil
    @Published var selectedTimeEnd: Date? = nil
    @Published var examName: String = ""
    @Published var Max_Degree: String = ""
    @Published var successDegree: String = ""
    
    // MARK: - Feedback
    @Published var message: String?
    @Published var isSuccess: Bool = false
    
    // MARK: - Services
    private let examService: ExamServiceProtocol
    
    // MARK: - Date Formatters
    private let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        return df
    }()
    
    private let timeFormatter: DateFormatter = {
        let tf = DateFormatter()
        tf.dateFormat = "HH:mm:ss"
        return tf
    }()
    
    init(examService: ExamServiceProtocol = ExamService()) {
        self.examService = examService
    }
    
    // MARK: - Input Validation
    private func validateInputs() -> String? {
        guard selectedGradeSubject != nil else { return "Please select Grade-Subject" }
        guard selectedExamType != nil else { return "Please select Exam Type" }
        guard let _ = selectedDate, let _ = selectedTimeStart, let _ = selectedTimeEnd else {
            return "Please select date and time"
        }
        guard let _ = Int(Max_Degree), let _ = Int(successDegree) else {
            return "Invalid degrees"
        }
        guard !examName.trimmingCharacters(in: .whitespaces).isEmpty else {
            return "Please enter exam name"
        }
        return nil
    }
    
    // MARK: - Computed property
    var isFormValid: Bool {
        return validateInputs() == nil
    }
    
    // MARK: - Reset Form
    private func resetForm() {
        selectedGradeSubject = nil
        selectedExamType = nil
        selectedDate = nil
        selectedTimeStart = nil
        selectedTimeEnd = nil
        examName = ""
        Max_Degree = ""
        successDegree = ""
    }
    
    // MARK: - Add Exam Function
    func submitExam() async {
        if let error = validateInputs() {
            message = error
            isSuccess = false
            return
        }
        
        do {
            let response = try await examService.requestExam(
                gradeSubject: selectedGradeSubject!,
                examName: examName,
                examDate: dateFormatter.string(from: selectedDate!),
                startTime: timeFormatter.string(from: selectedTimeStart!),
                endTime: timeFormatter.string(from: selectedTimeEnd!),
                maxDegree: Int(Max_Degree)!,
                successDegree: Int(successDegree)!,
                type: selectedExamType!.rawValue
            )
            message = response.message
            isSuccess = true
            resetForm()
        } catch {
            message = "Failed to schedule exam: \(error.localizedDescription)"
            isSuccess = false
        }
    }
}
