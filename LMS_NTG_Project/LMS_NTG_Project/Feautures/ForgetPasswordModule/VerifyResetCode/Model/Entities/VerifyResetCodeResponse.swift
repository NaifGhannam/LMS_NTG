//
//  VerifyResetCodeResponse.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 05/02/1447 AH.
//

import Foundation

struct VerifyResetCodeResponse: Codable {
    
    let verified: Bool
    let message: String
    let email: String
}
