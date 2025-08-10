//
//  SessionViewModel.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 11/02/1447 AH.
//

import Foundation

@MainActor
class SessionViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var sessions: [GradeSubjects] = []
    @Published var classes: [SchoolClass] = []
    
    @Published var selectedClass: SchoolClass? = nil
    @Published var selectedSession: GradeSubjects? = nil
    @Published var selectedDate: Date? = nil
    @Published var enteredNumber: String = ""
    @Published var selectedType: SessionType? = nil
    @Published var selectedStatus: Status? = nil
    
    @Published var message: String?
    @Published var status: String?
    
    var isButtonDisabled: Bool {
        return selectedClass == nil ||
        selectedSession == nil ||
        selectedDate == nil ||
        enteredNumber.isEmpty ||
        selectedType == nil ||
        selectedStatus == nil
    }
    
    private let sessionService: SessionServiceProtocol
    
    init(sessionService: SessionServiceProtocol = SessionService()) {
        self.sessionService = sessionService
    }
    
    func fetchData() async {
        
        isLoading = true
        errorMessage = nil
        
        do {
            
            let sessions = try await sessionService.getGradeSubjects()
            let classes = try await sessionService.getAllClasses()
            
            self.sessions = sessions
            self.classes = classes
            
            
        } catch {
            self.errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
    
    func sessionScheduling() async {
        
        isLoading = true
        errorMessage = nil
        
        // Convert selectedDate to String
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let sessionDateString = selectedDate != nil ? dateFormatter.string(from: selectedDate!) : ""
        
        do {
            
            let result = try await sessionService.sessionScheduling(
                classEntity: ClassEntity(classId: selectedClass?.classId ?? 0),
                gradeSubject: GradesSubject(gradeSubjectId: selectedSession?.gradeSubjectId ?? 0),
                sessionDate: sessionDateString,
                sessionNumber: Int(enteredNumber) ?? 0,
                type: selectedType?.rawValue.capitalized ?? "Unknown",
                status: selectedStatus?.rawValue.capitalized ?? "Unknown")
            
            self.message = result.message
            self.status = result.status
            
            clear()
            
            print(result.message)
            
        } catch {
            self.errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
    
    func clear() {
        
        selectedClass = nil
        selectedSession = nil
        selectedDate = nil
        enteredNumber = ""
        selectedType = nil
        selectedStatus = nil
    }
}
