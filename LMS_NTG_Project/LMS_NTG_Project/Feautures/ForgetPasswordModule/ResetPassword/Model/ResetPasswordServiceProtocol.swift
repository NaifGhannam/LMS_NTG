//
//  ResetPasswordServiceProtocol.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 06/02/1447 AH.
//

import Foundation

protocol ResetPasswordServiceProtocol {
    func resetPassword(email: String, verificationCode: String, newPassword: String) async throws -> ResetPasswordResponse
}
