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
                    .padding(.top,20)
                Progress()
                Announcements()
                AttendanceRateView()
                RecentGradeView()
            }
            
            .padding(.horizontal, 50)
            
        }.ignoresSafeArea(.all, edges: .top)
    }
}

//#Preview {
//    StudentDashboardView()
//}
