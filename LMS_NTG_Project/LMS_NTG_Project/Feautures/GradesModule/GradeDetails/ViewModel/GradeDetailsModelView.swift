//
//  GradeDetailsModelView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 19/02/1447 AH.
//

import Foundation

@MainActor
class GradeDetailsViewModel: ObservableObject {
    
    @Published var result: [GradeDetailsResponse]?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let gradeDetailsService: GradeDetailsServiceProtocol
    
    init(gradeDetailsService: GradeDetailsServiceProtocol = GradeDetailsService()) {
        self.gradeDetailsService = gradeDetailsService
    }
    
    func getGradeDetails() async {
        
        isLoading = true
        errorMessage = nil
        
        do {
            
            let result = try await gradeDetailsService.getGradeDetails(userId: 5, subjectId: 3)
            self.result = result
            
        } catch {
            self.errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
