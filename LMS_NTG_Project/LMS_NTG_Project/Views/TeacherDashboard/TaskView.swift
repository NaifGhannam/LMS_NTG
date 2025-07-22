//
//  TaskView.swift
//  LMS_NTG_Project
//
//  Created by Naif on 27/01/1447 AH.
//



import SwiftUI

struct TaskView   : View {
    @State private var tasks: [TaskItem] = [
        TaskItem(title: "Session number 1"),
        TaskItem(title: "Session number 2"),
        TaskItem(title: "Session number 3"),
        TaskItem(title: "Session number 4"),
        TaskItem(title: "Session number 5")
        
    ]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .strokeBorder(Color("PrimaryRed"), lineWidth: 3)
                )
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.black.opacity(0.5))
                        .blur(radius: 5)         
                        .offset(x: 5 , y: 5) // shadw offset
                    
                )
            
             
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(tasks.indices, id: \.self) { index in
                            HStack{
                                
                                
                                Button(action: {
                                    tasks[index].isCompleted.toggle()
                                }) {
                                    Image(systemName: tasks[index].isCompleted ? "checkmark.square.fill" : "square")
                                        .foregroundColor(tasks[index].isCompleted ? .green : .gray)
                                        .font(.system(size: 22))
                                }
                                
                                Text(tasks[index].title)
                                    .font(.system(size: 24))
                                    .foregroundColor(.primary)
                                   
                            }
                        }
                    }
                    .padding(.top, 5)
                
            
        }
       
        .padding(.horizontal , 50)
        .padding(.vertical , 15)
    }
}

struct TaskItem {
    var title: String
    var isCompleted: Bool = false
}

#Preview {
    TeacherDashboard()
}
