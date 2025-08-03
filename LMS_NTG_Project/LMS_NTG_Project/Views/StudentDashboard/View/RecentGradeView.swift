//
//  RecentGradeView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 26/01/1447 AH.
//

import SwiftUI

struct RecentGradeView: View {
    @ObservedObject var ViewModel = StudentDashboardViewModel()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(Color("PrimaryPink"))
                .shadow(color: .black.opacity(0.3), radius: 5, y: 3)
            
            VStack {
                
                Text("Recent Grade")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color("PrimaryRed"))
                    .padding(.bottom, 10)
                
                ForEach(ViewModel.recentGrades, id: \.id) { grade in
                    
                    HStack {
                        Text(grade.title)
                            
                        Spacer()
                        
                        Text(grade.grade)
                            .frame(width: 35, alignment: .leading)
                    }
                    .foregroundColor(Color("DarkRed"))
                    .font(.system(size: 14))
                    .padding(.horizontal, 25)
                    .frame(maxWidth: .infinity)
                            .padding(.vertical, 5)
                    .background(RoundedRectangle(cornerRadius: 28)
                                
                            .fill(Color("DarkPink")))
                            .padding(5)                }
                
                Spacer()
            }
            .padding()
        }
        .frame(minHeight: 150)
    }
}

#Preview {
    RecentGradeView()
        .padding(.horizontal, 50)
}
