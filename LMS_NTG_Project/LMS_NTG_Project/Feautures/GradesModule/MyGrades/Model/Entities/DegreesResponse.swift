//
//  DegreesResponse.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 06/02/1447 AH.
//

import Foundation

struct DegreesResponse: Codable {
    
    let degreeId: Int
    let referenceId: Int
    let degree: Int
    let type: String
    let value: String
}
