//
//  TeacherDashboardServiceProtocol.swift
//  LMS_NTG_Project
//
//  Created by Naif on 24/02/1447 AH.
//


import Foundation
protocol TeacherDashboardServiceProtocol {
    func fetchDashboardData(for teacherId: Int) async throws -> TeacherDashboardResponse
}
