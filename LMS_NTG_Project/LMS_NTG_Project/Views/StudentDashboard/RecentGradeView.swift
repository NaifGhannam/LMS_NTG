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
            
            VStack {
                
                Text("Upcoming Sessions")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(Color("PrimaryRed"))
                    .padding(14)
                
                ForEach(recentGrades, id: \.id) { grade in
                    
                    HStack {
                        Text(grade.title)
                            
                        Spacer()
                        
                        Text(grade.grade)
                    }
                    .foregroundColor(Color("DarkRed"))
                    .padding(.horizontal)
                }
                
                Spacer()
            }
            .padding()
        }
        .shadow(color: .black.opacity(0.3), radius: 5, y: 3)
        .frame(minHeight: 200)
    }
}

#Preview {
    RecentGradeView()
}

struct Grade: Identifiable {
    
    let id: UUID = UUID()
    let title: String
    let grade: String
}
