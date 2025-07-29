//
//  LoginServiceProtocol.swift
//  LMS_NTG_Project
//
//  Created by Naif on 04/02/1447 AH.
//

import Foundation

protocol LoginServiceProtocol {
    func login(email: String, password: String) async throws -> LoginResponse
}
