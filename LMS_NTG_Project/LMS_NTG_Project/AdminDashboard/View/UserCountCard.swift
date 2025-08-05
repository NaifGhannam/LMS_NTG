//
//  UserCountCard.swift
//  LMS_NTG_Project
//
//  Created by Naif on 11/02/1447 AH.
//

import SwiftUI
import UIKit


struct UserCountCard : View {
    @StateObject var viewModel = AdminDashbordViewModel()
    var body: some View {
            let totalWidth = UIScreen.main.bounds.width
            let spacing = 20.0
            let padding = 14.0 * 2
            let cardWidth = (totalWidth - (spacing + padding) ) / 2
            VStack(alignment: .leading, spacing: 8){
                
                Text("user count")
                    .font(.system(size: 28))
                    .foregroundColor(.gray)
                Spacer()
                HStack{
                    Text("\(viewModel.userCount)")
                        .font(.system(size: 34))
                        .foregroundColor(Color("PrimaryRed"))
                        .padding(.trailing,16)
                    
                    Spacer()
                    Image(systemName: "person.fill.badge.plus")
                        .resizable()
                        .foregroundColor(Color("PrimaryRed"))
                        .frame(width: 30, height: 30)
                }
            }
            .padding()
            .frame(width: cardWidth, height: 140)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: .gray.opacity(0.1), radius: 3, x: 0, y: 1)
    }
}
