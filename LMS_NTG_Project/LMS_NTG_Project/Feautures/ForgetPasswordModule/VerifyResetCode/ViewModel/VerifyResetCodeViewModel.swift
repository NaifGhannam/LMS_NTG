//
//  VerifyResetCodeViewModel.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 05/02/1447 AH.
//

import Foundation

@MainActor
class VerifyResetCodeViewModel: ObservableObject {
    
    @Published var code: String = ""
    @Published var isLoading: Bool = false
    @Published var verified: Bool?
    @Published var message: String?
    @Published var errorMessage: String?
    
    private var verifyResetCodeService: VerifyResetCodeServiceProtocol
    
    init(verifyResetCodeService: VerifyResetCodeServiceProtocol = VerifyResetCodeService()) {
        
        self.verifyResetCodeService = verifyResetCodeService
    }
    
    func verifyResetCode(email: String) async -> Bool{
        
        self.isLoading = true
        defer { self.isLoading = false }
        self.errorMessage = nil
        
        do {
            
            let result = try await verifyResetCodeService.verifyResetCode(email: email, code: code)
            
            self.verified = result.verified
            self.message = result.message
            return true
            
        } catch {
            self.errorMessage = error.localizedDescription
            return false
        }
    }
}
