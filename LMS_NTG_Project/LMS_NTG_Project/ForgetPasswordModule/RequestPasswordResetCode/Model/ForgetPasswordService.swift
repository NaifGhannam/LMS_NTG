//
//  ForgetPasswordService.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 04/02/1447 AH.
//

import Foundation

struct ForgetPasswordService: ForgetPasswordServiceProtocol {
    
    func forgetPassword(email: String) async throws -> ResetResponse {
        let request = ResetRequest(
            email: email
        )
        
        return try await NetworkManager.shared.request(
            endpoint: .requestReset,
            body: request
        )
    }
}
