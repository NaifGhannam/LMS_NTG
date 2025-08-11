//
//  ForgetPasswordViewModel.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 04/02/1447 AH.
//

import Foundation

@MainActor
class ForgetPasswordViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var message: String?
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let forgetPasswordService: ForgetPasswordServiceProtocol

    init(forgetPasswordService: ForgetPasswordServiceProtocol = ForgetPasswordService()) {
        self.forgetPasswordService = forgetPasswordService
    }

    func forgetPassword() async -> Bool {
        
        self.isLoading = true
        defer { self.isLoading = false }
        self.errorMessage = nil

        do {
            
            let result = try await forgetPasswordService.forgetPassword(email: email)
            self.message = result.message
            return true
            
        } catch {
            self.errorMessage = error.localizedDescription
            return false
        }
    }
}
