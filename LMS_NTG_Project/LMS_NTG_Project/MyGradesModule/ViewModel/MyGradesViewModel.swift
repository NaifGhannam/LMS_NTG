//
//  MyGradesViewModel.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 06/02/1447 AH.
//

import Foundation

@MainActor
class MyGradesViewModel: ObservableObject {
    
    @Published var selectedSubject: SubjectGrade? = nil
    @Published var degree: Int?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    @Published var subjectGrades: [SubjectGrade] = [
        SubjectGrade(name: "Math", icon: "math", grade: "B+"),
        SubjectGrade(name: "Physics", icon: "ph", grade: "A+"),
        SubjectGrade(name: "English", icon: "en", grade: "A+"),
        SubjectGrade(name: "Arabic", icon: "ar", grade: "C+"),
        SubjectGrade(name: "IT", icon: "it", grade: "A")
    ]
    
    private let degreesService: DegreesServiceProtocol
    
    init(degreesService: DegreesServiceProtocol = DegreesService()) {
        self.degreesService = degreesService
    }

    func getDegrees(id: Int) async {
        
        isLoading = true
        errorMessage = nil

        do {
            
            let result = try await degreesService.getDegrees(id: id)
            self.degree = result.degree
            
        } catch {
            self.errorMessage = error.localizedDescription
        }

        isLoading = false
    }
    
    func displaySubject() -> [SubjectGrade] {
        if let selected = selectedSubject {
            return subjectGrades.filter { $0 == selected }
        } else {
            return subjectGrades
        }
    }
}
