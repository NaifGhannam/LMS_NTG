//
//  ChangePasswordService.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 17/02/1447 AH.
//

import Foundation

struct ChangePasswordService: ChangePasswordServiceProtocol {
    
    func changePassword(email: String, currentPassword: String, newPassword: String) async throws -> ChangePasswordResponse {
        let  request = ChangePasswordRequest(email: email, currentPassword: currentPassword, newPassword: newPassword)
        
        return try await NetworkManager.shared.request(endpoint: .changePassword, body: request)
    }
}
