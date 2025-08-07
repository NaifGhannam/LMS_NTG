//
//  RecentActivityView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 20/01/1447 AH.
//

import SwiftUI
import Charts

struct RecentActivityView: View {
    var body: some View {
        VStack{
            Text("Recent Activity Log")
                .font(.system(size: 19, weight: .semibold))
                .foregroundColor(Color("PrimaryRed"))
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(.leading)
            
            Chart{
                ForEach(MockData2.users){ user in
                    SectorMark(angle : .value("User",user.time), innerRadius: .ratio(0.6),angularInset: 2  )
                        .foregroundStyle(by: .value("User",user.user))
                }
            }
          .frame(width: .infinity , height: UIScreen.main.bounds.height * 0.3)
            
        }
       
    }
}


#Preview {
    RecentActivityView()
        .background(Color("PrimaryLightGray"))
}

struct User_log : Identifiable {
    var id = UUID()
    var time : Int
    var user : String
}

struct MockData2 {
    static let users : [User_log] = [
        User_log(id: UUID(), time: 1, user: "techer"),
        User_log(id: UUID(), time: 2, user: "student"),
        User_log(id: UUID(), time: 3, user: "parent"),
        ]
}












