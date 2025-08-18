//
//  TeacherDashboardService.swift
//  LMS_NTG_Project
//
//  Created by Naif on 24/02/1447 AH.
//
import Foundation

class TeacherDashboardService: TeacherDashboardServiceProtocol {
    
    func fetchDashboardData(for teacherId: Int) async throws -> TeacherDashboardResponse {
        guard let url = URL(string: "http://196.221.167.63:8080/api/v1/mobile-dashboard/teacher/\(teacherId)") else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(TeacherDashboardResponse.self, from: data)
    }
}
