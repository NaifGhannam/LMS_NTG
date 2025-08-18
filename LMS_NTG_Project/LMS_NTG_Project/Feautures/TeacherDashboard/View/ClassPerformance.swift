//
//  ClassPreformance.swift
//  LMS_NTG_Project
//
//  Created by Naif on 17/02/1447 AH.
//

import SwiftUI
import Charts

struct ClassPreformance: View {
    
    let data: [ClassOpject]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Class Performance")
                .font(.headline)
            
            HStack {
                Spacer()
                Text("Average Score %")
                    .font(.caption)
                    .foregroundStyle(.btnText)
                Spacer()
            }
            
            Chart {
                ForEach(data) { inst in
                    BarMark(
                        x: .value("Class Name", inst.name),
                        y: .value("Value", Double(inst.value))
                    )
                    .foregroundStyle(inst.Color)
                }
            }
            .frame(height: 250)
        }
        .padding()
    }
}

#Preview {
    ClassPreformance(data: [
        ClassOpject(name: "Grade 5A", value: 92 , Color: .green),
        ClassOpject(name: "Grade 6A", value: 65, Color: .pink),
        ClassOpject(name: "Grade 6B", value: 80, Color: .blue)
    ])
}

struct ClassOpject: Identifiable {
    var id: UUID = UUID()
    var name: String
    var value: Int
    var Color: Color
}
