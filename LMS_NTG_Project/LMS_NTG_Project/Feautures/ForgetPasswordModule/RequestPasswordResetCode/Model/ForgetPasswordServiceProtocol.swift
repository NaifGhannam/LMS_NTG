//
//  ForgetPasswordServiceProtocol.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 04/02/1447 AH.
//

import Foundation

protocol ForgetPasswordServiceProtocol {
    func forgetPassword(email: String) async throws -> ResetResponse
}
