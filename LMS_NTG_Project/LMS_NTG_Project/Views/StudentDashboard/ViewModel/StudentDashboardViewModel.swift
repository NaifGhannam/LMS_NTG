//
//  Untitled.swift
//  LMS_NTG_Project
//
//  Created by Naif on 09/02/1447 AH.
//

import Foundation
import SwiftUI
class StudentDashboardViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    @Published var name : String = ""
    
    @Published var upcomingSessions: [Session] = [
        Session(title: "Java", date: "Apr 25", time: "1:00pm"),
        Session(title: "Flutter", date: "July 25", time: "2:00pm"),
        Session(title: "DB", date: "Oct 25", time: "3:00pm"),
        Session(title: "Testing", date: "Apr 30", time: "7:00pm"),
    ]
    
    @Published var recentGrades: [Grade] = [
        Grade(title: "Java", grade: "A+"),
        Grade(title: "Flutter", grade: "A"),
        Grade(title: "DB", grade: "C"),
        Grade(title: "Testing", grade: "D"),
    ]
    
    @Published  var Announcements : [String] = ["New assignment posted!" , "New lecture scheduled!" , "New exam scheduled!"]
    
    
    
    private let studentService: StudentServiceProtocol
    
    init(studentService: StudentServiceProtocol = StudentService()) {
        self.studentService = studentService
    }
    
    
    func getStudentInfo(id: Int) async {
        
        isLoading = true
        errorMessage = nil

        do {
            
            let result = try await studentService.getStudentInfo(id: id)
            self.name = result.name
            
        } catch {
            self.errorMessage = error.localizedDescription
        }

        isLoading = false
    }
    
}
