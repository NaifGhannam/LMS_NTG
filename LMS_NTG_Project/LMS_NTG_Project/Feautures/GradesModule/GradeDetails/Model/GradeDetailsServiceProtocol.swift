//
//  GradeDetailsServiceProtocol.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 19/02/1447 AH.
//

import Foundation

protocol GradeDetailsServiceProtocol {
    func getGradeDetails(userId: Int, subjectId: Int) async throws -> [GradeDetailsResponse]
}
