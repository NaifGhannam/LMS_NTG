//
//  ResetPasswordServiceProtocol.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 06/02/1447 AH.
//

import Foundation

protocol ResetPasswordServiceProtocol {
    func resetPassword(newPassword: String, resetToken: String) async throws -> ResetPasswordResponse
}
