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
    @Published var selectedGrade: SubjectGrade? = nil
    @Published var degree: Int?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    @Published var subjectGrades: [SubjectGrade] = [
        SubjectGrade(name: "Math", icon: "math", grade: "B+"),
        SubjectGrade(name: "Physics", icon: "ph", grade: "B"),
        SubjectGrade(name: "English", icon: "en", grade: "A+"),
        SubjectGrade(name: "Arabic", icon: "ar", grade: "C+"),
        SubjectGrade(name: "IT", icon: "it", grade: "A")
    ]
    
    @Published var allSubjects = [
        SubjectGrades(
            subjectName: "Math",
            grades: [
                GradeDetail(score: 92, type: "Exam 1", description: "Algebra lesson 1"),
                GradeDetail(score: 85, type: "Homework 1", description: "Geometry lesson 1"),
                GradeDetail(score: 88, type: "Quiz 2", description: "Fractions and decimals"),
                GradeDetail(score: 97, type: "Project 1", description: "Statistics project"),
                GradeDetail(score: 100, type: "Participation", description: "Class discussion")
            ]
        ),
        SubjectGrades(
            subjectName: "Physics",
            grades: [
                GradeDetail(score: 78, type: "Quiz 1", description: "Unit one"),
                GradeDetail(score: 91, type: "Exam 1", description: "Newton's Laws"),
                GradeDetail(score: 84, type: "Homework 2", description: "Projectile motion problems"),
                GradeDetail(score: 93, type: "Project", description: "Energy conservation experiment")
            ]
        ),
        SubjectGrades(
            subjectName: "English",
            grades: [
                GradeDetail(score: 95, type: "Project 1", description: "Short story writing"),
                GradeDetail(score: 88, type: "Exam 1", description: "Grammar & comprehension"),
                GradeDetail(score: 92, type: "Homework 3", description: "Essay: My Dream Job"),
                GradeDetail(score: 100, type: "Participation", description: "Reading aloud in class")
            ]
        ),
        SubjectGrades(
            subjectName: "Arabic",
            grades: [
                GradeDetail(score: 100, type: "Participation", description: "Class discussion"),
                GradeDetail(score: 96, type: "Exam 1", description: "Poetry analysis"),
                GradeDetail(score: 88, type: "Homework 2", description: "Grammar exercises"),
                GradeDetail(score: 94, type: "Project", description: "Storytelling project")
            ]
        ),
        SubjectGrades(
            subjectName: "IT",
            grades: [
                GradeDetail(score: 97, type: "Project", description: "Build a personal website"),
                GradeDetail(score: 89, type: "Exam 1", description: "HTML & CSS basics"),
                GradeDetail(score: 93, type: "Quiz 2", description: "Networking concepts"),
                GradeDetail(score: 100, type: "Participation", description: "Helping classmates debug code")
            ]
        )]
    
    
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
    
    func displayFilteredSubjects() -> [SubjectGrade] {
        subjectGrades.filter { subject in
            let matchesSubject = selectedSubject == nil || subject == selectedSubject
            let matchesGrade = selectedGrade == nil || subject == selectedGrade
            return matchesSubject && matchesGrade
        }
    }
}
