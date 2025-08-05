//
//  LoginResponse.swift
//  LMS_NTG_Project
//
//  Created by Naif on 04/02/1447 AH.
//

import Foundation

struct Role: Codable {
    let roleId: Int
    let roleName: String
}

struct LoginResponse: Codable {
    let accountId: Int
    let role: Role
    let userId: Int
    let email: String
}
