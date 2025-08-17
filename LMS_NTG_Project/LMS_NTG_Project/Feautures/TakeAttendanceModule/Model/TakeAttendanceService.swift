//
//  TakeAttendanceService.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 23/02/1447 AH.
//

import Foundation

struct TakeAttendanceService: TakeAttendanceServiceProtocol {
    
    func getStudent(id: Int) async throws -> [StudentRespons] {
        
        return try await NetworkManager.shared.request(endpoint: .getStudent(id: id))
    }
}
