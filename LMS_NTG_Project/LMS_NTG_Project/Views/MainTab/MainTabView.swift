//
//  MainTabView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 25/01/1447 AH.
//

import SwiftUI

struct MainTabView: View {
//    1 -> ADMIN
//    2 -> STUDENT
//    3 -> TEACHER
    var UserType: Int = 2
    var body: some View {
        
        TabView {
            switch UserType {
            case 1: // admin
             
                Text("profile")
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("profile")
                    }
                Admin_dashoard()
                    .tabItem {
                        Image(systemName: "rectangle.split.3x1")
                        Text("Dashboard")
                    }
                SessionSchedulingView()
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("Session Scheduling")
                    }
             
                
              
                ExamSchedulingView()
                    .tabItem {
                        Image(systemName: "calendar.badge.clock")
                        Text("Exam Scheduling")
                    }
                
            case 2:  // Student
                Text("Dashboard")
                    .tabItem {
                        Image(systemName: "rectangle.split.3x1")
                        Text("Dashboard")
                    }
                Text("profile")
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("profile")
                    }
                Text("My Grades")
                    .tabItem {
                        Image(systemName: "rosette")
                        Text("My Grades")
                    }
                Text("Attendance Record")
                    .tabItem {
                        Image(systemName: "checkmark.square")
                        Text("Attendance Record")
                    }
            case 3: // Techear
                Text("profile")
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("profile")
                    }
                Text("Dashboard")
                    .tabItem {
                        Image(systemName: "rectangle.split.3x1")
                        Text("Dashboard")
                    }
                Text("Take Attendance")
                    .tabItem {
                        Image(systemName: "checkmark.square")
                        Text("Take Attendance")
                    }
                
                    
            default:
                Text("Default")
            }
            
        
        }
        .tint(Color("PrimaryRed"))
    }
}

#Preview {
    MainTabView()
}
