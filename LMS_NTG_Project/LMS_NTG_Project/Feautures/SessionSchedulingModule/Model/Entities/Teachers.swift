//
//  Teachers.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 13/02/1447 AH.
//

import Foundation

struct Teachers: Hashable, Codable {
    
    let teacherId: Int
    let user: Users
    let specialization: String
    let yearsOfExperience: Int
    let qualification: String
}
