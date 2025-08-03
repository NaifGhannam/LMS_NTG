//
//  AttendanceRateView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 26/01/1447 AH.
//

import SwiftUI
import Charts
struct AttendanceRateView: View {
    

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
           
                
                Chart{
                    ForEach(MockData.students){ student in
                        SectorMark(angle: .value("Student", student.value ), angularInset: 2)
                            .foregroundStyle(.red)
                    }
                }
                
                
                
            }
            .padding()
        }
        //.frame(height: 95)
    }
}

#Preview {
    AttendanceRateView()
        .padding(.horizontal, 50)
}

struct StudentAttendance : Identifiable{
    let id : UUID = UUID()
    let name : String
    let value : Int
}


struct MockData {
    static let students : [StudentAttendance] = [
        
        .init(name: "Oussama", value: 15),
        .init(name: "Nabil", value: 50),
        .init(name: "Anass", value: 150)]
}
