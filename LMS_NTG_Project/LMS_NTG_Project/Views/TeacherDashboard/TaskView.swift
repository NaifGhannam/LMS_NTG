//
//  TaskView.swift
//  LMS_NTG_Project
//
//  Created by Naif on 27/01/1447 AH.
//



import SwiftUI

struct TaskView   : View {
    @Binding  var tasks: [TaskItem]
    
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
                                
                                                                
                                Text(tasks[index].title)
                                    .font(.system(size: 24))
                                    .foregroundColor(.primary)
                                    .padding(.leading, 30)
                                    .padding(3)
                                   
                                Spacer()
                                Button(action: {
                                    tasks[index].isCompleted.toggle()
                                }) {
                                    Image(systemName: tasks[index].isCompleted ? "checkmark.square.fill" : "square")
                                        .foregroundColor(tasks[index].isCompleted ? Color("PrimaryRed"): .gray)
                                        .font(.system(size: 22))
                                        .padding(.trailing, 30)
                                }
                                
                                   
                            }
                            .background(
                                VStack {
                                    Spacer()
                                    Rectangle()
                                        .frame(height: 1)
                                        .foregroundColor(Color.gray.opacity(0.5))
                                        .padding(.horizontal , 20)
                                }
                            )
                            
                        }                    }
                    .padding(.vertical, 40)
            
                
            
        }
       
        .padding(.horizontal , 20)
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
