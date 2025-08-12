//
//  ListOfClasses.swift
//  LMS_NTG_Project
//
//  Created by Naif on 17/02/1447 AH.
//

import SwiftUI

struct ListOfClasses: View {
    
    @State var toDayClasses : [ToDayClass] = [
        ToDayClass(name: "Grade 5A - Mathematics", time: "08:00 - 09:00", status: .incoming, room: "Room 201 | 22 Student"),
        ToDayClass(name: "Grade 6B - Mathematics", time: "9:00 - 10:00", status: .upcoming, room: "Room 251 | 22 Student"),
        ToDayClass(name: "Grade 5A - Mathematics", time: "9:00 - 10:00", status: .upcoming, room: "Room 201 | 5 Student"),
    ]
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Todays Classes")
                .font(.headline)
                .padding(.bottom, 5)
            
            VStack(spacing: 0) {
                ForEach(toDayClasses.indices, id: \.self) { index in
                    HStack {
                        Text(toDayClasses[index].time)
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Text(toDayClasses[index].name)
                                .font(.system(size: 14, weight: .bold))
                            Text(toDayClasses[index].room)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        
                        Text(toDayClasses[index].status.rawValue)
                            .font(.caption)
                            .foregroundColor(toDayClasses[index].status.color)
                            .padding(6)
                            .background(toDayClasses[index].status.color.opacity(0.2))
                            .cornerRadius(5)
                    }
                    .padding(.vertical, 8)
                    
                    if index < toDayClasses.count - 1 {
                        Divider()
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ListOfClasses()
}


struct ToDayClass : Identifiable  {
    var id : UUID = UUID()
    var name : String
    var time : String
    var status : ClassStatus
    var room : String
}

enum ClassStatus : String {
    case incoming = "In coming", upcoming = "Up coming" , finished = "Finished"
    
    var color: Color {
        switch self {
        case .incoming:
            return .green
        case .upcoming:
            return .chartBlue
        case .finished:
            return .red
        }
    }
}
