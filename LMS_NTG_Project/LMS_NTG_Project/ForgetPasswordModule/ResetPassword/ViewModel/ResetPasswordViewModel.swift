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
    
    @Published var isLoading: Bool = false
    @Published var message: String?
    @Published var errorMessage: String?
    
    private var resetPasswordService: ResetPasswordServiceProtocol
    
    init(resetPasswordService: ResetPasswordServiceProtocol = ResetPasswordService()) {
        
        self.resetPasswordService = resetPasswordService
    }
    
    func resetPassword() async {
        
        self.isLoading = true
        self.errorMessage = nil
        
        do {
            let result = try await resetPasswordService.resetPassword(newPassword: newPassword, resetToken: "")
            
            self.message = result.message
        } catch {
            self.errorMessage = error.localizedDescription
        }
        
        self.isLoading = false
    }
}
