//
//  ResetPasswordRequest.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 06/02/1447 AH.
//

import Foundation

struct ResetPasswordRequest: Codable {
    
    let email: String
    let verificationCode: String
    let newPassword: String
}
