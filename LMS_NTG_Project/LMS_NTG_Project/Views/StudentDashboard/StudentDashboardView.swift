//
//  StudentDashboardView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 26/01/1447 AH.
//

import SwiftUI

struct StudentDashboardView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                UpcomingSessionsView()
                UpcomingSessionsView()
                UpcomingSessionsView()
                UpcomingSessionsView()
            }
            .padding(.horizontal, 50)
            
        }
    }
}

#Preview {
    StudentDashboardView()
}
