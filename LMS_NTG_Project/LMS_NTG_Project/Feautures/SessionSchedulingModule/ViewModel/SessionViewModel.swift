//
//  SessionViewModel.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 11/02/1447 AH.
//

import Foundation

@MainActor
class SessionViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let sessionService: SessionServiceProtocol
    
    init(sessionService: SessionServiceProtocol = SessionService()) {
        self.sessionService = sessionService
    }

    func sessionScheduling() async {
        
        isLoading = true
        errorMessage = nil

        do {
            
            let result = try await sessionService.sessionScheduling()
            
        } catch {
            self.errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
