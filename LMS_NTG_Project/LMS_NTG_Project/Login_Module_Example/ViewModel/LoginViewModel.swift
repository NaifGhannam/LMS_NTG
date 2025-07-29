//
//  LoginViewModel.swift
//  LMS_NTG_Project
//
//  Created by NTG on 28/07/2025.
//

import Foundation

@MainActor
class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var isLoggedIn = false
    @Published var user: User?
    @Published var errorMessage: String?

    private let loginService: LoginServiceProtocol

    init(loginService: LoginServiceProtocol = LoginService()) {
        self.loginService = loginService
    }

    func login() async {
        isLoading = true
        errorMessage = nil

        do {
            let result = try await loginService.login(email: email, password: password)
            self.user = result.user
            self.isLoggedIn = true
//            TokenStore.shared.save(token: result.token)
        } catch {
            self.errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
