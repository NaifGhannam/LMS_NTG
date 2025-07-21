//
//  UpcomingSessionsView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 26/01/1447 AH.
//

import SwiftUI

struct UpcomingSessionsView: View {
    
    @State var upcomingSessions: [Session] = [
        Session(title: "Java", date: "Apr 25", time: "1:00pm"),
        Session(title: "Flutter", date: "July 25", time: "2:00pm"),
        Session(title: "DB", date: "Oct 25", time: "3:00pm"),
        Session(title: "Testing", date: "Apr 30", time: "7:00pm"),
    ]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(Color("PrimaryPink"))
            
            VStack {
                
                Text("Upcoming Sessions")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(Color("PrimaryRed"))
                    .padding(14)
                
                ForEach(upcomingSessions, id: \.id) { session in
                    
                    HStack {
                        Text(session.title)
                            
                        Spacer()
                        
                        Text("\(session.date), \(session.time)")
                    }
                    .foregroundColor(Color("DarkRed"))
                    .padding(.horizontal)
                }
                
                Spacer()
            }
            .padding()
        }
        .shadow(color: .black.opacity(0.3), radius: 5, y: 3)
        .frame(minHeight: 200)
    }
}

#Preview {
    UpcomingSessionsView()
        .padding(.horizontal, 50)
}

struct Session: Identifiable {
    
    let id: UUID = UUID()
    let title: String
    let date: String
    let time: String
}


