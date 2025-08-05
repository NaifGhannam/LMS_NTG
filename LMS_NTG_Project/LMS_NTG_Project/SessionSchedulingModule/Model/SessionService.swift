//
//  SessionService.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 11/02/1447 AH.
//

import Foundation

struct SessionService: SessionServiceProtocol {
    
    func sessionScheduling() async throws -> SessionResponse {
        
        return try await NetworkManager.shared.request(endpoint: .sessionScheduling)
    }
}
