//
//  RecentGradeView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 26/01/1447 AH.
//

import SwiftUI

struct RecentGradeView: View {
    
    @State var recentGrades: [Grade] = [
        Grade(title: "Java", grade: "A+"),
        Grade(title: "Flutter", grade: "A"),
        Grade(title: "DB", grade: "C"),
        Grade(title: "Testing", grade: "D"),
    ]
    
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
                
                ForEach(recentGrades, id: \.id) { grade in
                    
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
                    .background(RoundedRectangle(cornerRadius: 10)
                                
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

struct Grade: Identifiable {
    
    let id: UUID = UUID()
    let title: String
    let grade: String
}
