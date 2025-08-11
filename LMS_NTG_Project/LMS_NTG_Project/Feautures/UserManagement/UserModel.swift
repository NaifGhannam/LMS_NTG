//
//  UserModel.swift
//  LMS_NTG_Project
//
//  Created by NTG on 24/07/2025.
//

import Foundation

struct UserModel: Identifiable {
    let id = UUID()
    let name: String
    let email: String
    let role: String
    let status: String
}
