//
//  GradeDetailsService.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 19/02/1447 AH.
//

import Foundation

struct GradeDetailsService: GradeDetailsServiceProtocol {
    
    func getGradeDetails(userId: Int, subjectId: Int) async throws -> [GradeDetailsResponse] {
        
        return try await NetworkManager.shared.request(endpoint: .getGradesDetails(userId: userId, subjectId: subjectId))
    }
}
