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

    func forgetPassword() async {
        
        isLoading = true
        errorMessage = nil

        do {
            
            let result = try await forgetPasswordService.forgetPassword(email: email)
            self.message = result.message
            
        } catch {
            self.errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
