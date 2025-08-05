//
//  LoginService.swift
//  LMS_NTG_Project
//
//  Created by NTG on 28/07/2025.


import Foundation

struct LoginService: LoginServiceProtocol {
    func login(email: String, password: String) async throws -> LoginResponse {
        let request = LoginRequest(
            email: email,
            password: password
        )
        
        return try await NetworkManager.shared.request(
            endpoint: .login,
            body: request
        )
    }
}
