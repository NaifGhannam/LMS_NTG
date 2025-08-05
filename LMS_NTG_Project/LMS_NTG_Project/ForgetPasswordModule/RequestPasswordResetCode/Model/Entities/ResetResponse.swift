//
//  ResetResponse.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 04/02/1447 AH.
//

import Foundation

struct ResetResponse: Codable {
    
    let expiresIn: String
    let message: String
    let email: String
}
