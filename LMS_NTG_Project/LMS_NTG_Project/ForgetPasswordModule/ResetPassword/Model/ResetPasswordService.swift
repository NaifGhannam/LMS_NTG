//
//  ResetPasswordService.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 06/02/1447 AH.
//

import Foundation

struct ResetPasswordService: ResetPasswordServiceProtocol {
    
    func resetPassword(newPassword: String, resetToken: String) async throws -> ResetPasswordResponse {
        
        let request = ResetPasswordRequest(newPassword: newPassword, resetToken: resetToken)
        
        return try await NetworkManager.shared.request(endpoint: .resetPassword, body: request)
    }
}

