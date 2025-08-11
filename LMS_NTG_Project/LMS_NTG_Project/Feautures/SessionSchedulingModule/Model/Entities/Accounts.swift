//
//  Accounts.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 13/02/1447 AH.
//

import Foundation

struct Accounts: Hashable, Codable {
    
    let accountId: Int
    let email: String
    let password: String
    let status: String
    let createdAt: String
    let lastReset: String?
}
