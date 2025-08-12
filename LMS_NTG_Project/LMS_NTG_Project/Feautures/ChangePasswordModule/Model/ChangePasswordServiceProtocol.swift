//
//  ChangePasswordServiceProtocol.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 17/02/1447 AH.
//

import Foundation

protocol ChangePasswordServiceProtocol {
    func changePassword(email: String, currentPassword: String, newPassword: String) async throws -> ChangePasswordResponse
}
