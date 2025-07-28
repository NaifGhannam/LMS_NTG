//
//  LoginResponse.swift
//  LMS_NTG_Project
//
//  Created by NTG on 28/07/2025.
//

import Foundation

struct LoginResponse: Decodable {
    let token: String
    let user: User
}

struct User: Decodable {
    let id: Int
    let email: String
    let name: String
}
