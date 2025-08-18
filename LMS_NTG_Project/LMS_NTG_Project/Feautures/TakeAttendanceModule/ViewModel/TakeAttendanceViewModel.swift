//
//  TakeAttendanceViewModel.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 23/02/1447 AH.
//

import Foundation

@MainActor
class TakeAttendanceViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var students: [StudentResponse]?
    @Published var sessions: [AttendanceResponse]?
    @Published var errorMessage: String?
    @Published var message: String?
    
    private var takeAttendanceService: TakeAttendanceServiceProtocol
    
    init(takeAttendanceService: TakeAttendanceServiceProtocol = TakeAttendanceService()) {
        
        self.takeAttendanceService = takeAttendanceService
    }
    
    func fetchData() async {
        
//        self.isLoading = true
//        self.errorMessage = nil
//        
//        do {
//            
//            let students = try await takeAttendanceService.getStudent(id: 2)
//            let sessions = try await takeAttendanceService.getAttendanceSession(id: 2)
//            self.students = students
//            self.sessions = sessions
//            
//        } catch {
//            self.errorMessage = error.localizedDescription
//            
//            print(error.localizedDescription)
//        }
//        
//        self.isLoading = false
    }
    
    func takeAttendance() async {
        
        self.isLoading = true
        self.errorMessage = nil
        
        do {
            print("-----------------------------------------------------")
            let result = try await takeAttendanceService.takeAttendance(attendanceId: 3, studentId: 6, status: "Present", notes: "")
            
            self.message = result.message
            print(result.message)
            print("-----------------------------------------------------")
        } catch {
            self.errorMessage = error.localizedDescription
            
            print(error.localizedDescription)
        }
        
        self.isLoading = false
    }
}
