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
            
            StudentDashboardHeader()
            
            VStack(spacing: 20) {
              
                UpcomingSessionsView()
                Progress()
                UpcomingSessionsView()
                Announcements()
                UpcomingSessionsView()
                UpcomingSessionsView()
            }
            
            .padding(.horizontal, 30)
            
        }.ignoresSafeArea(.all, edges: .top)
    }
}

#Preview {
    StudentDashboardView()
}
