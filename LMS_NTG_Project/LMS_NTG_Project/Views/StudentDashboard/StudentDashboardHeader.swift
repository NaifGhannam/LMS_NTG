//
//  StudentDashboardHeader.swift
//  LMS_NTG_Project
//
//  Created by Naif on 26/01/1447 AH.
//

import SwiftUI

//struct StudentDashboardHeader: View {
//    var body: some View {
//        VStack{
//            Rectangle()
//                .fill(Color("PrimaryRed"))
//                .frame(height: UIScreen.main.bounds.height * 0.17 )
//               
//                .clipShape(RoundedCornerShape(corners: .bottomRight, radius: 100))
//                .overlay(
//                    Text("Student Dashboard")
//                        .font(.system(size: 30, weight: .bold, design: .default))
//                        .foregroundColor(.white)
//                        .padding(.top, 50)
//                    )
//            Spacer()
//        }
//        .ignoresSafeArea()
//        .padding(.trailing, 10)
//    }
//}

struct RoundedCornerShape: Shape {
    var corners: UIRectCorner
    var radius: CGFloat

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

//#Preview {
//    StudentDashboardHeader()
//}


import SwiftUI

struct StudentDashboardHeader: View {
    var body: some View {
        ZStack {
            Color("PrimaryRed")
                .clipShape(RoundedCornerShape(corners: [.bottomRight], radius: 50))

            Text("Student Dashboard")
                .font(.system(size: 26, weight: .bold))
                .foregroundColor(.white)
                .padding(.top,60)
                .padding(.bottom,24)
        }
        .ignoresSafeArea()
        .padding(.trailing,10)
    }
}
