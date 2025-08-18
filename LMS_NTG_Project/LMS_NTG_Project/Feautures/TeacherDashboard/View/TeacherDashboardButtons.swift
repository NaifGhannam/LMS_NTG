//
//  TeacherDashboardButtons.swift
//  LMS_NTG_Project
//
//  Created by Naif on 17/02/1447 AH.
//

import SwiftUI
import SwiftUICore

struct TeacherDashboardButtons: View {
    
    let studentsCount: Int
    let subjectsCount: Int
    let assignmentsCount: Int
    
    var body: some View {
        HStack(spacing: 10) {
            
            // Students
            HStack {
                Image(systemName: "person.crop.circle.fill")
                VStack(alignment: .leading, spacing: 2) {
                    Text("Students")
                        .font(.system(size: 10, weight: .medium))
                    Text("\(studentsCount)")
                        .font(.system(size: 12, weight: .bold))
                }
            }
            .padding()
            .background(Color("PrimaryRed").opacity(0.5))
            .foregroundColor(.white)
            .cornerRadius(10)
            
            // Subjects
            HStack {
                Image(systemName: "book.fill")
                VStack(alignment: .leading, spacing: 2) {
                    Text("Subjects")
                        .font(.system(size: 10, weight: .medium))
                    Text("\(subjectsCount)")
                        .font(.system(size: 12, weight: .bold))
                }
            }
            .padding()
            .background(Color("PrimaryRed").opacity(0.5))
            .foregroundColor(.white)
            .cornerRadius(10)
            
            // Assignments
            HStack {
                Image(systemName: "doc.text.fill")
                VStack(alignment: .leading, spacing: 2) {
                    Text("Assignments")
                        .font(.system(size: 10, weight: .medium))
                    Text("\(assignmentsCount)")
                        .font(.system(size: 12, weight: .bold))
                }
            }
            .padding()
            .background(Color("PrimaryRed").opacity(0.5))
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}
