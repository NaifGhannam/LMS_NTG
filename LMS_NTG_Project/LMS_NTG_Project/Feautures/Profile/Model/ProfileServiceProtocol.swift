//
//  ProfileServiceProtocol.swift
//  LMS_NTG_Project
//
//  Created by Naif on 15/02/1447 AH.
//


import Foundation

protocol ProfileServiceProtocol {
    func fetchProfile(request: ProfileRequest) async throws -> ProfileResponse
}
