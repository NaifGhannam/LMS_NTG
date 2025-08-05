//
//  UpcomingSessionsView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 26/01/1447 AH.
//

import SwiftUI

struct UpcomingSessionsView: View {
    
    @StateObject var ViewModel = StudentDashboardViewModel()
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(Color("PrimaryPink"))
                .shadow(color: .black.opacity(0.3), radius: 5, y: 3)
            
            VStack {
                
                Text("Upcoming Sessions")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color("PrimaryRed"))
                    .padding(.bottom, 10)
                
                ForEach(ViewModel.upcomingSessions, id: \.id) { session in
                    
                    HStack {
                        Text(session.title)
                            
                        Spacer()
                        
                        Text("\(session.date), \(session.time)")
                    }
                    .foregroundColor(Color("DarkRed"))
                    .font(.system(size: 14))
                    .padding(.horizontal, 25)
                    .frame(maxWidth: .infinity)
                            .padding(.vertical, 5)
                    .background(RoundedRectangle(cornerRadius: 28)
                                
                            .fill(Color("DarkPink")))
                            .padding(5)
                }
                
                Spacer()
            }
            .padding()
        }
        .frame(minHeight: 150)
    }
}

#Preview {
    UpcomingSessionsView(ViewModel: StudentDashboardViewModel())
        .padding(.horizontal, 50)
}
