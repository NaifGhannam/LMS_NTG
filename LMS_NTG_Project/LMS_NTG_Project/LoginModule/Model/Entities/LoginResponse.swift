//
//  LoginResponse.swift
//  LMS_NTG_Project
//
//  Created by Naif on 04/02/1447 AH.
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
