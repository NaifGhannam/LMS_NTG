//
//  ResetPasswordResponse.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 06/02/1447 AH.
//

import Foundation

struct ResetPasswordResponse: Codable {
    
    let resetAt: String
    let message: String
    let email: String
}
