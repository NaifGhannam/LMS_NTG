//
//  VerifyResetCodeServiceProtocol.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 05/02/1447 AH.
//

import Foundation

protocol VerifyResetCodeServiceProtocol {
    func verifyResetCode(email: String, code: String) async throws -> VerifyResetCodeResponse
}
