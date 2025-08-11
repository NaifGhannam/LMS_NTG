//
//  ResetPasswordService.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 06/02/1447 AH.
//

import Foundation

struct ResetPasswordService: ResetPasswordServiceProtocol {
    
    func resetPassword(email: String, verificationCode: String, newPassword: String) async throws -> ResetPasswordResponse {
        
        let request = ResetPasswordRequest(email: email, verificationCode: verificationCode, newPassword: newPassword)
        
        return try await NetworkManager.shared.request(endpoint: .resetPassword, body: request)
    }
}

