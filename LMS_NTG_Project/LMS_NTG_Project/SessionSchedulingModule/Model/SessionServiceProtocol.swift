//
//  SessionServiceProtocol.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 11/02/1447 AH.
//

import Foundation

protocol SessionServiceProtocol {
    func sessionScheduling() async throws -> SessionResponse
}
