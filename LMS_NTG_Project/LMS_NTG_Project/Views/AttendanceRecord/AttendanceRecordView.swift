//
//  AttendanceRecordView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 28/01/1447 AH.
//

import SwiftUI

struct AttendanceRecordView: View {
    
    let attendanceRecord: [Attendance] = [
        Attendance(day: "Sunday", isPresent: true),
        Attendance(day: "Monday", isPresent: true),
        Attendance(day: "Tuesday", isPresent: true),
        Attendance(day: "Wednesday", isPresent: false),
        Attendance(day: "Thursday", isPresent: true),
        Attendance(day: "Friday", isPresent: true),
        Attendance(day: "Saturday", isPresent: false)
    ]
    
    var body: some View {
        ZStack {
            
            Color.pink.opacity(0.05)
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                
                HStack {
                    Button(action: {}) {
                        Image("black_right_chevron")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    
                    Spacer()
                    
                    Text("Attendance Record")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.primaryRed)
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image("upload")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                    }
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                
                VStack(spacing: 8) {
                    
                    InfoCard(title: "Total Days", value: "30")
                    InfoCard(title: "Attendance", value: "5")
                    InfoCard(title: "Absence", value: "25")
                }
                .padding(.horizontal, 20)
                
               RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
                    .frame(height: 150)
                    .padding(.horizontal, 20)
                    .overlay {
                        Text("Chart Data")
                    }
                
                VStack(alignment: .leading) {
                    
                   Text("Your Attendance this week")
                        .foregroundColor(.primaryRed)
                        .font(.system(size: 16, weight: .bold))
                    
                    Spacer()
                        .frame(height: 23)
                    
                    List(attendanceRecord, id: \.day) { record in
                        
                        HStack {
                            
                            Text(record.day)
                                .font(.system(size: 16))
                            
                            Spacer()
                            
                            if record.isPresent {
                                Image(systemName: "checkmark.circle")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundStyle(.green)
                                    .frame(width: 30)
                                    
                            } else {
                                Image(systemName: "xmark")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundStyle(.red)
                                    .frame(width: 30)
                            }
                        }
                    }
                    .listStyle(.plain)
                    .scrollIndicators(.hidden)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .padding(.horizontal, 20)
                
                Spacer()
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    AttendanceRecordView()
}

struct Attendance {
    let day: String
    let isPresent: Bool
}

