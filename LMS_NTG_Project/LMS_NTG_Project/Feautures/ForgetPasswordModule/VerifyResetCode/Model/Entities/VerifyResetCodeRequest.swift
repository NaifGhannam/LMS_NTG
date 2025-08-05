//
//  VerifyResetCodeRequest.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 05/02/1447 AH.
//

import Foundation

struct VerifyResetCodeRequest: Codable {
    
    let email: String
    let code: String
}
