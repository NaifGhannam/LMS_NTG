//
//  StudentsAttendancesService.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 09/02/1447 AH.
//

import Foundation

struct StudentsAttendancesService: StudentsAttendancesServiceProtocol {
    
    func getStudentsAttendances(id: Int) async throws -> StudentsAttendancesResponse {
        
        return try await NetworkManager.shared.request(
            endpoint: .getStudentsAttendances(id: id)
        )
    }
}
