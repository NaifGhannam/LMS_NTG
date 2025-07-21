//
//  AttendanceRateView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 26/01/1447 AH.
//

import SwiftUI

struct AttendanceRateView: View {
    
    @State var dateRange = Date()...Date().addingTimeInterval(10)
    @State var progress: Double = 40.0
    let timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(Color("DarkPink"))
            
            HStack {
                
                Text("Attendance Rate")
                    .font(.system(size: 19, weight: .semibold))
                    .foregroundColor(Color("PrimaryRed"))
                    .frame(maxHeight: .infinity, alignment: .topLeading)
                    .padding(.leading, 4)
                
                Spacer()
                
                Gauge(value: progress, in: 0...100) {
                    Text("Loading ...")
                } currentValueLabel: {
                    Text("\(Int(progress))%")
                        .font(.system(size: 12))
                }
                .gaugeStyle(.accessoryCircularCapacity)
                .tint(Color("PrimaryRed"))
            }
            .padding()
        }
        .frame(height: 95)
    }
}

#Preview {
    AttendanceRateView()
        .padding(.horizontal, 50)
}
