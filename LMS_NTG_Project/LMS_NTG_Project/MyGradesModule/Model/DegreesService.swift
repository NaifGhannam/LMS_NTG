//
//  DegreesService.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 09/02/1447 AH.
//

import Foundation

struct DegreesService: DegreesServiceProtocol {
    
    func getDegrees(id: Int) async throws -> DegreesResponse {
        let request = DegreesRequest(
            id: id
        )
        
        return try await NetworkManager.shared.request(
            endpoint: .getDegrees(id: id),
            body: request
        )
    }
}
