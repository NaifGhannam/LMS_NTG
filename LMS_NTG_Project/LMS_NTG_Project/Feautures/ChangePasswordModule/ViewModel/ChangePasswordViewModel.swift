//
//  ChangePasswordViewModel.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 17/02/1447 AH.
//

import Foundation

@MainActor
class ChangePasswordViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var currentPassword = ""
    @Published var newPassword = ""
    @Published var confirmNewPassword = ""
    @Published var message: String?
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let changePasswordService: ChangePasswordServiceProtocol

    init(changePasswordService: ChangePasswordServiceProtocol = ChangePasswordService()) {
        self.changePasswordService = changePasswordService
    }

    func changePassword() async {
        
        self.isLoading = true
        self.errorMessage = nil

        do {
            
            let result = try await changePasswordService.changePassword(email: email, currentPassword: currentPassword, newPassword: newPassword)
            self.message = result.message
            
        } catch {
            self.errorMessage = error.localizedDescription
        }
        
        self.isLoading = false
    }
}
