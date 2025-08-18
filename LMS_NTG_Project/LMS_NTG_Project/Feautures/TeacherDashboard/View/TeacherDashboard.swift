//
//  TeacherDashboard.swift
//  LMS_NTG_Project
//
//  Created by Naif on 27/01/1447 AH.
//
import SwiftUI
struct TeacherDashboard: View {
@StateObject private var viewModel = TeacherDashboardViewModel()

var body: some View {
    VStack {
        HeaderView(title: "Dashboard")
        
        ScrollView {
            VStack(spacing: 20) {
                if let data = viewModel.dashboardData {
                    TeacherDashboardButtons(
                        studentsCount: data.studentsCount,
                        subjectsCount: data.subjectsCount,
                        assignmentsCount: data.assignmentsCount
                    )
                }

                // Show classes list
                if let data = viewModel.dashboardData {
                    ListOfClasses(
                        toDayClasses: data.teacherTodayClasses.map { $0.toUIModel() }
                    )
                    
                    // Class performance chart
                    ClassPreformance(data: data.classPerformance.map {
                        ClassOpject(
                            name: $0.className,
                            value: Int($0.performanceScore),
                            Color: .blue
                        )
                    })
                    .frame(height: 250)
                    
                    // --- Text Insights ---
                    VStack(alignment: .leading, spacing: 8) {
                        // Top Performing Class
                        if let topClass = data.classPerformance.max(by: { $0.performanceScore < $1.performanceScore }) {
                            Text("Top Performance: \(topClass.className) (\(Int(topClass.performanceScore))%)")
                                .font(.headline)
                        }
                        Rectangle()
                            .frame(height: 1)
                        
                        // Attention Needed Class (lowest score)
                        if let lowClass = data.classPerformance.min(by: { $0.performanceScore < $1.performanceScore }) {
                            Text("Attention Needed: \(lowClass.className) (\(Int(lowClass.performanceScore))%)")
                                .font(.headline)
                        }
                        Rectangle()
                            .frame(height: 1)
                        // Most Improved Class (from classNotes)
                        if let improvedClass = data.classNotes.first(where: { $0.performanceCategory.lowercased() == "most improved" }) {
                            Text("Most Improved: \(improvedClass.className) (\(Int(improvedClass.percentage))%)")
                                .font(.headline)
                            }
                    }
                    .padding()
                    
                } else if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let error = viewModel.errorMessage {
                    Text("Error: \(error)")
                        .foregroundColor(.red)
                }
                
            } // VStack
            .padding()
        } // ScrollView
    }
    .task {
        await viewModel.loadDashboard()
    }
}
}
