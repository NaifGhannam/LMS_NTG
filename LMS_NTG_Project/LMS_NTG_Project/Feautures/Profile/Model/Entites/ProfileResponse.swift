//
//  ProfileResponse.swift
//  LMS_NTG_Project
//
//  Created by Naif on 15/02/1447 AH.
//
import Foundation
struct ProfileResponse: Codable {
    let data: UserData
    let message: String
    let status: String
    let timestamp: String
}

struct UserData: Codable {
    let userId: Int
    let role: Role
    let firstName: String
    let middleName: String
    let lastName: String
    let gender: String
    let address: String
    let birthDate: String
    let phoneNumber: String
    let photo: String?
    let nationalId: String
    let isDeleted: Bool
    let joinedOn: String
    let leftOn: String?
    let account: Account
}

struct Account: Codable {
    let accountId: Int
    let email: String
    let password: String
    let status: String
    let createdAt: String
    let lastReset: String?
}
