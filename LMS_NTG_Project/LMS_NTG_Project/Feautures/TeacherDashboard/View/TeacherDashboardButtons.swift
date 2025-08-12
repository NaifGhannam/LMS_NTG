//
//  TeacherDashboardButtons.swift
//  LMS_NTG_Project
//
//  Created by Naif on 17/02/1447 AH.
//

import SwiftUICore



struct TeacherDashboardButtons : View {
    var body : some View {
        HStack{
            
            HStack{
                Image(systemName: "person.crop.circle.fill")
                Text("Students")
                    .font(.system(size: 10, weight: .medium))
                
                    
            }
            .padding()
            .background(Color("PrimaryRed").opacity(0.5))
            .foregroundColor(.white)
            .cornerRadius(10)
            
            HStack{
                Image(systemName: "person.crop.circle.fill")
                Text("Subjects")
                    .font(.system(size: 10, weight: .medium))
                
                    
            }
            .padding()
            .background(Color("PrimaryRed").opacity(0.5))
            .foregroundColor(.white)
            .cornerRadius(10)
            
            HStack{
                Image(systemName: "person.crop.circle.fill")
                Text("Assigments Due")
                    .font(.system(size: 10, weight: .medium))
                
                    
            }
            .padding()
            .background(Color("PrimaryRed").opacity(0.5))
            .foregroundColor(.white)
            .cornerRadius(10)
            
      
        }

    }
    
}
