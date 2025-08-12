//
//  TeacherDashboard.swift
//  LMS_NTG_Project
//
//  Created by Naif on 27/01/1447 AH.
//



import SwiftUI

struct TeacherDashboard: View {
    
    var body: some View {
        
        HeaderView(title: "Dashboard")
        
        ScrollView {
            
            VStack {
                
                TeacherDashboardButtons()
                
                ListOfClasses()
                    .background(.red)
                
                ClassPreformance(data: [
                    ClassOpject(name: "Grade 5A", value: 92, Color: .green),
                    ClassOpject(name: "Grade 6A", value: 65, Color: .pink),
                    
                    ClassOpject(name: "Grade 6A", value: 65, Color: .pink),
                    ClassOpject(name: "Grade 6A", value: 65, Color: .pink),
                    ClassOpject(name: "Grade 6A", value: 65, Color: .pink),
                    ClassOpject(name: "Grade 6B", value: 80, Color: .blue)
                ])
                .background(.gray)
                
                VStack {
                    
                    HStack {
                        Text("Top preforming Class")
                        Spacer()
                        Text("Grade 5A 92%")
                    }
                    
                    Rectangle()
                        .frame(width: .infinity, height: 1)
                        .foregroundColor(.gray)
                    
                    HStack {
                        Text("Most improved")
                        Spacer()
                        Text("Grade 6B (+15%)")
                    }
                    
                    Rectangle()
                        .frame(width: .infinity, height: 1)
                        .foregroundColor(.gray)
                    
                    HStack {
                        Text("Attention needed")
                        Spacer()
                        Text("Grade 6A 68%")
                    }
                    
                }
                .padding()
            }
        }
        
        Spacer()
    } // end body
}


#Preview {
    TeacherDashboard()
}


