//
//  ProfileViewModel.swift
//  LMS_NTG_Project
//
//  Created by Naif on 15/02/1447 AH.
//

import Foundation
@MainActor
class ProfileViewModel: ObservableObject {
    @Published var profile : UserData?
    @Published var isLoading: Bool = false
    @Published var errorMessage : String?
    
   private let service: ProfileServiceProtocol
    
        init(service : ProfileServiceProtocol = ProfileService()){
            self.service = service
        }
    func loadProfile(userId : Int) async {
        isLoading = true
        errorMessage = nil
        do{
            let request = ProfileRequest(userId: userId) // ✅ wrap in ProfileRequest

            let response = try await service.fetchProfile( request: request)
            profile = response.data
        }catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
  

}
