//
//  AttendanceViewModel.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 09/02/1447 AH.
//

import Foundation

@MainActor
class AttendanceViewModel: ObservableObject {
    
    @Published var data: String?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    @Published var chartData: [DataPoint] = [
        // Blue line
        .init(month: "Jan", value: 20, category: "Attendance"),
        .init(month: "Feb", value: 22, category: "Attendance"),
        .init(month: "Mar", value: 28, category: "Attendance"),
        .init(month: "Apr", value: 30, category: "Attendance"),
        .init(month: "Mai", value: 20, category: "Attendance"),
        .init(month: "Jun", value: 30, category: "Attendance"),
        
        // Pink line
        .init(month: "Jan", value: 10, category: "Participation"),
        .init(month: "Feb", value: 20, category: "Participation"),
        .init(month: "Mar", value: 20, category: "Participation"),
        .init(month: "Apr", value: 15, category: "Participation"),
        .init(month: "Mai", value: 17, category: "Participation"),
        .init(month: "Jun", value: 20, category: "Participation"),
        
        // Purple line
        .init(month: "Jan", value: 5, category: "Engagement"),
        .init(month: "Feb", value: 15, category: "Engagement"),
        .init(month: "Mar", value: 18, category: "Engagement"),
        .init(month: "Apr", value: 20, category: "Engagement"),
        .init(month: "Mai", value: 15, category: "Engagement"),
        .init(month: "Jun", value: 25, category: "Engagement")
    ]
    
    private let studentsAttendancesService: StudentsAttendancesServiceProtocol
    
    init(studentsAttendancesService: StudentsAttendancesServiceProtocol = StudentsAttendancesService()) {
        self.studentsAttendancesService = studentsAttendancesService
    }

    func getStudentsAttendances(id: Int) async {
        
        isLoading = true
        errorMessage = nil

        do {
            
            let result = try await studentsAttendancesService.getStudentsAttendances(id: id)
            self.data = result.data
            
        } catch {
            self.errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
