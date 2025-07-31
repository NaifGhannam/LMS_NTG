//
//  ResetPasswordRequest.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 06/02/1447 AH.
//

import Foundation

struct ResetPasswordRequest: Codable {
    
    let newPassword: String
    let resetToken: String
}
