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
                        Image("Profile")
                        Text("profile")
                    }
                Admin_dashoard()
                    .tabItem {
                        Image("Dashbord_icon")
                        Text("Dashboard")
                    }
                SessionSchedulingViewEx()
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
                StudentDashboardView()
                    .tabItem {
                        Image("Dashbord_icon")
                        Text("Dashboard")
                    }
                Text("profile")
                    .tabItem {
                        Image("Profile")
                        Text("profile")
                    
                    }
               
                Text("Attendance Record")
                    .tabItem {
                        Image("2person")
                        Text("Attendance Record")
                    }
                Text("My Grades")
                    .tabItem {
                        Image("A+")
                        Text("My Grades")
                    }
            case 3: // Techear
                Text("profile")
                    .tabItem {
                        Image("Profile")
                        Text("profile")
                    }
                Text("Dashboard")
                    .tabItem {
                        Image("Dashbord_icon")

                        Text("Dashboard")
                    }
                Text("Take Attendance")
                    .tabItem {
                        Image("2person")
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
