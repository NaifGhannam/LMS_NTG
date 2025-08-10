//
//  SessionResponse.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 13/02/1447 AH.
//

import Foundation

struct SessionResponse: Codable {
    let data: SessionData
    let message: String
    let status: String
    let timestamp: String
}

struct SessionData: Codable {
    let sessionId: Int
    let sessionDate: String
    let sessionNumber: Int
    let type: String
    let timeTable: String?
    let status: String
}
