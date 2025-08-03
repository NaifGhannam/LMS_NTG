//
//  WeeklyAttendanceView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 09/02/1447 AH.
//

import SwiftUI

struct WeeklyAttendanceView: View {
    
    let attendanceRecord: [Attendance] = [
        Attendance(day: "Sunday", hour: 9),
        Attendance(day: "Monday", hour: 9),
        Attendance(day: "Tuesday", hour: 9),
        Attendance(day: "Wednesday", hour: 4),
        Attendance(day: "Thursday", hour: 9)
    ]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
           Text("Your Attendance this week")
                .foregroundColor(.primaryRed)
                .font(.system(size: 16, weight: .bold))
            
            Spacer()
                .frame(height: 20)
            
            List(attendanceRecord, id: \.day) { record in
                
                HStack {
                    
                    Text(record.day)
                                    
                    Spacer()
                    
                    Text("\(record.hour) hours")
                }
                .font(.system(size: 16))
            }
            .listStyle(.plain)
            .scrollIndicators(.hidden)
            .frame(height: UIScreen.main.bounds.height * 0.25)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.25), radius: 5, x: 0, y: 4)

    }
}

#Preview {
    WeeklyAttendanceView()
        .padding(20)
}

struct Attendance {
    let day: String
    let hour: Int
}
