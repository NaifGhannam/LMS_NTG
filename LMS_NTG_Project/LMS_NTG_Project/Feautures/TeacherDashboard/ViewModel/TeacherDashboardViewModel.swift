//
//  TeacherDashboardViewModel.swift
//  LMS_NTG_Project
//
//  Created by Naif on 24/02/1447 AH.
//

import Foundation

@MainActor
class TeacherDashboardViewModel: ObservableObject {
    
    @Published var dashboardData: DashboardData?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    //@Published var userName: String = ""

    
    private let service: TeacherDashboardServiceProtocol
    
    init(service: TeacherDashboardServiceProtocol = TeacherDashboardService()) {
        self.service = service
    }
    
    func loadDashboard() async {
        guard let userId = UserDefaults.standard.value(forKey: "userId") as? Int else {
            self.errorMessage = "No userId found. Please login."
            return
        }
        
        isLoading = true
        defer { isLoading = false }
        
        do {
            let response = try await service.fetchDashboardData(for: userId)
            self.dashboardData = response.data
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
}
