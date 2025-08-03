//
//  AttendanceRecordView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 09/02/1447 AH.
//

import SwiftUI
import Charts

struct AttendanceRecordView: View {
    
    @StateObject private var viewModel = AttendanceViewModel()
    
    var body: some View {
        VStack {
            
            HeaderView(showFirstIcon: true, showSecondIcon: true, title: "Attendance Record")
            
            VStack(spacing: 14) {
                
                Spacer()
                    .frame(height: 4)
                
                InfoCard(title: "Total Days", value: "30")
                InfoCard(title: "Attendance", value: "25")
                InfoCard(title: "Absence", value: "5")
                
                CardView {
                    Chart {
                        ForEach(viewModel.chartData) { dataPoint in
                            LineMark(
                                x: .value("Month", dataPoint.month),
                                y: .value("Value", dataPoint.value)
                            )
                            .foregroundStyle(by: .value("Category", dataPoint.category))
                            .symbol(Circle())
                        }
                    }
                    .chartForegroundStyleScale([
                        "Attendance": Color("ChartPink"),
                        "Participation": Color("ChartBlue"),
                        "Engagement": Color("ChartPurple")
                    ])
                    .chartLegend(.hidden)
                    .chartYAxis {
                        AxisMarks(position: .leading)
                    }
                    .frame(height: UIScreen.main.bounds.height * 0.16)
                }
                .padding(.bottom, 10)
                
                WeeklyAttendanceView()
            }
            .padding(.horizontal, 20)
        }
        
        Spacer()
    }
}

#Preview {
    AttendanceRecordView()
}
