//
//  VerifyResetCodeService.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 05/02/1447 AH.
//

import Foundation

struct VerifyResetCodeService: VerifyResetCodeServiceProtocol {
    
    func verifyResetCode(email: String, code: String) async throws -> VerifyResetCodeResponse {
        
        let request = VerifyResetCodeRequest(email: email, code: code)
        
        return try await NetworkManager.shared.request(endpoint: .verifyResetCode, body: request)
        
    }
}
