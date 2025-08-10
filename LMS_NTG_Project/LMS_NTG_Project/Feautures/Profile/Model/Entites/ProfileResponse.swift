//
//  ProfileResponse.swift
//  LMS_NTG_Project
//
//  Created by Naif on 15/02/1447 AH.
//
import Foundation

struct ProfileResponse: Codable {
    let data: UserData?
}

struct UserData: Codable {
    let firstName: String?
    let lastName: String?
    let account: Account?
}

struct Account: Codable {
    let email: String?
}
