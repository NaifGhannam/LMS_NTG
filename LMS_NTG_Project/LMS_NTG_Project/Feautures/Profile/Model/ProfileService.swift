//
//  ProfileService.swift
//  LMS_NTG_Project
//
//  Created by Naif on 15/02/1447 AH.
//

struct ProfileService : ProfileServiceProtocol {
    func fetchProfile(request: ProfileRequest) async throws -> ProfileResponse {
        
        try await NetworkManager.shared.request(
            endpoint: .getProfile(id: request.userId),
            
        )
    }
    
    
}
