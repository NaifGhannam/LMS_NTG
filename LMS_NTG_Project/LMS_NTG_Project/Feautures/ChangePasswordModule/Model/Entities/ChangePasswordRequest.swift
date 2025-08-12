//
//  ChangePasswordRequest.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 17/02/1447 AH.
//

import Foundation

struct ChangePasswordRequest: Codable {
    
    let email: String
    let currentPassword: String
    let newPassword: String
}
