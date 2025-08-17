//
//  TakeAttendanceViewModel.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 23/02/1447 AH.
//

import Foundation

@MainActor
class TakeAttendanceViewModel: ObservableObject {
    
    @Published var newPassword: String = ""
    @Published var confirmNewPassword: String = ""
    
    @Published var isLoading: Bool = false
    @Published var students: [StudentRespons]?
    @Published var errorMessage: String?
    
    private var takeAttendanceService: TakeAttendanceServiceProtocol
    
    init(takeAttendanceService: TakeAttendanceServiceProtocol = TakeAttendanceService()) {
        
        self.takeAttendanceService = takeAttendanceService
    }
    
    func getStudents() async {
        
        self.isLoading = true
        self.errorMessage = nil
        
        do {
            
            print("---------------------------------------------------------")
            
            let result = try await takeAttendanceService.getStudent(id: 2)
            self.students = result
            
            print("---------------------------------------------------------")
            
            print(result)
        } catch {
            self.errorMessage = error.localizedDescription
        }
        
        self.isLoading = false
    }
}
