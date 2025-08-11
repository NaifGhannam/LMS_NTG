//
//  ResetPasswordViewModel.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 06/02/1447 AH.
//

import Foundation

@MainActor
class ResetPasswordViewModel: ObservableObject {
    
    @Published var newPassword: String = ""
    @Published var confirmNewPassword: String = ""
    
    @Published var isLoading: Bool = false
    @Published var message: String?
    @Published var errorMessage: String?
    
    private var resetPasswordService: ResetPasswordServiceProtocol
    
    init(resetPasswordService: ResetPasswordServiceProtocol = ResetPasswordService()) {
        
        self.resetPasswordService = resetPasswordService
    }
    
    func resetPassword(email: String, verificationCode: String) async -> Bool {
        
        self.isLoading = true
        defer { self.isLoading = false }
        self.errorMessage = nil
        
        do {
            let result = try await resetPasswordService.resetPassword(email: email, verificationCode: verificationCode, newPassword: newPassword)
            self.message = result.message
            return true
        } catch {
            self.errorMessage = error.localizedDescription
            return false
        }
    }
}
