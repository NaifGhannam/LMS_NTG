//
//  Users.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 13/02/1447 AH.
//

import Foundation

struct Users: Hashable, Codable {
    
    let userId: Int
    let role: Roles
    let firstName: String
    let middleName: String?
    let lastName: String
    let gender: String
    let address: String
    let birthDate: String
    let phoneNumber: String
    let photo: String?
    let nationalId: String
    let isDeleted: Bool
    let joinedOn: String?
    let leftOn: String?
    let account: Accounts
}
