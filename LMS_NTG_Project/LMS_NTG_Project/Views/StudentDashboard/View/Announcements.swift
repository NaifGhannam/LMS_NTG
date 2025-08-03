//
//  Announcements.swift
//  LMS_NTG_Project
//
//  Created by Naif on 26/01/1447 AH.
//

import SwiftUI

struct Announcements: View {
    
    @State private var Announcements : [String] = ["New assignment posted!" , "New lecture scheduled!" , "New exam scheduled!"]
    
    var body: some View {
        VStack {
            
            Text("Pending Assignments")
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(Color("PrimaryRed"))
                .padding(14)
            
        ForEach(Announcements, id: \.self) { Announcement in
                HStack {
                
                    Image(systemName: "bell")
                        .foregroundColor(Color("PrimaryRed"))
                    
                    Text(Announcement)
                        .foregroundColor(Color("DarkRed"))}
        }.frame(maxWidth: .infinity)
                .padding(.vertical, 5)
        .background(RoundedRectangle(cornerRadius: 10)
                    
                .fill(Color("DarkPink")))
                .padding(5)
            Spacer()
            
        }
        .frame(maxWidth: .infinity , minHeight: 200)
        .background(Color("PrimaryPink"))
        .cornerRadius(25)
        .shadow(color: .black.opacity(0.3), radius: 5, y: 3)
      
    }
}

#Preview {
    Announcements()
}
