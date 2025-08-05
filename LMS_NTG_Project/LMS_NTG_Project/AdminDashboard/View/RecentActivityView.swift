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














//
//VStack(alignment: .leading) {
//    
//    Text("Recent Activity Log")
//        .font(.title)
//        .foregroundColor(Color("PrimaryRed"))
//        .padding(.bottom, 10)
//        .bold()
//    
//    HStack {
//        Text("Time")
//        Spacer()
//        Text("User")
//        Spacer()
//        Text("Action")
//    }
//    .frame(maxWidth: .infinity, alignment: .center)
//    .padding(10)
//    .padding(.horizontal, 10)
//    .background(.white)
//    .foregroundColor(.gray)
//    .font(.title)
//    .cornerRadius(15)
//    
//    VStack {
//        
//        ForEach(1...8, id: \.self) { _ in
//            HStack {
//                Text("4:00AM")
//                Spacer()
//                Text("User1")
//                Spacer()
//                Text("Login")
//            }
//            .frame(maxWidth: .infinity, alignment: .center)
//            .padding(10)
//            .background(Color.white)
//        }
//    }
//    .padding()
//    .background(Color.white)
//    .cornerRadius(20)
//}
