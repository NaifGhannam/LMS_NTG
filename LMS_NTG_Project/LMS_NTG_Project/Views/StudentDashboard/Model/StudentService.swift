//
//  StudentService.swift
//  LMS_NTG_Project
//
//  Created by Naif on 09/02/1447 AH.
//

struct StudentService : StudentServiceProtocol {
    func getStudentInfo(id : Int) async throws -> StudentRespons {
        return try await NetworkManager.shared.request(
            endpoint: .studentInfo(id: id)
          
        )
    }
    
    
}
