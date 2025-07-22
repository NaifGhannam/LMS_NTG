//
//  TeacherDashboardHeader.swift
//  LMS_NTG_Project
//
//  Created by Naif on 27/01/1447 AH.
//



import SwiftUI

struct TeacherDashboardHeader: View {
    var body: some View {
        VStack{
            
            HStack{
                Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .frame(width: 25, height: 30)
                    
                    .foregroundColor(Color.white)
                
                Text("Teacher Dashboard")
                    .font(.system(size: 25))
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.leading)
                    
                
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .padding(.leading)
                    .foregroundColor(Color.white)
                
                Image(systemName: "calendar")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .padding(.leading)
                    .foregroundColor(Color.white)
               
                
                
            }
            .padding(.bottom)
            
            
        }.frame(height: UIScreen.main.bounds.height * 0.05 )
        .frame(maxWidth: .infinity , minHeight: 10)
        .background(Color("PrimaryRed"))
        
        
    }
}

#Preview {
    TeacherDashboard()
}
