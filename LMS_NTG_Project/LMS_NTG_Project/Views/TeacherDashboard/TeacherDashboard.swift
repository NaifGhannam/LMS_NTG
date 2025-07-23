//
//  TeacherDashboard.swift
//  LMS_NTG_Project
//
//  Created by Naif on 27/01/1447 AH.
//



import SwiftUI

struct TeacherDashboard: View {
    @State private var Session: [TaskItem] = [
        TaskItem(title: "Session number 1"),
        TaskItem(title: "Session number 2"),
        TaskItem(title: "Session number 3")
        
    ]
    @State private var Exams: [TaskItem] = [
        TaskItem(title: "Exam number 1"),
        TaskItem(title: "Exam number 2"),
        TaskItem(title: "Exam number 3"),
        TaskItem(title: "Exam number 4")
        
    ]
    var body: some View {
        TeacherDashboardHeader()
        ScrollView{
            
            
            VStack (alignment: .leading){
                Text("Roles & Permissions")
                    .font(.title)
                    .foregroundColor(Color("PrimaryRed"))
                    .bold()
                    .padding(.leading, 20)
                
                TaskView(tasks: $Session )
                VStack (alignment: .leading){
                    Text("Roles & Permissions")
                        .font(.title)
                        .foregroundColor(Color("PrimaryRed"))
                        .bold()
                        .padding(.leading, 20)
                }
                
                TaskView(tasks: $Exams )
                
                
                HStack{
                    Text("Take Attendance")
                        .font(.system(size: 22, weight: .medium))
                        .font(.headline)
                        .foregroundColor(.blue)
                        .shadow(radius: 5)
                        .padding(.leading, 10)
                        Spacer()
                    Text("Enter Grades")
                        .font(.system(size: 22, weight: .medium))
                        .foregroundColor(.blue)
                        .shadow(radius: 5)
                        .padding(.trailing, 40)
                        
                    
                }.padding(.top, 20)
                    .padding(.leading, 20)
                
                
                
            }
        }}
    
}
    

#Preview {
    TeacherDashboard()
}
