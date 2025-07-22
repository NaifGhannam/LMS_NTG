//
//  TeacherDashboard.swift
//  LMS_NTG_Project
//
//  Created by Naif on 27/01/1447 AH.
//



import SwiftUI

struct TeacherDashboard: View {

    var body: some View {
        TeacherDashboardHeader()
       VStack {
           TaskView()
              
           TaskView()
        }
      
    }
}

#Preview {
    TeacherDashboard()
}
