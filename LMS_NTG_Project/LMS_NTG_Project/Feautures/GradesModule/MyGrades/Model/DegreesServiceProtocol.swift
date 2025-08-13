//
//  DegreesServiceProtocol.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 09/02/1447 AH.
//

import Foundation

protocol DegreesServiceProtocol {
    func getDegrees(id: Int) async throws -> DegreesResponse
}
