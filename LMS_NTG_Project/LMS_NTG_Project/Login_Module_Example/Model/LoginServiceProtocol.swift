//
//  LoginServiceProtocol.swift
//  LMS_NTG_Project
//
//  Created by NTG on 28/07/2025.
//

import Foundation

protocol LoginServiceProtocol {
    func login(email: String, password: String) async throws -> LoginResponse
}
