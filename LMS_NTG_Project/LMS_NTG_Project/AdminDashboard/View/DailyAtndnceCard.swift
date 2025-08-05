//
//  DailyAtndnceCard.swift
//  LMS_NTG_Project
//
//  Created by Naif on 11/02/1447 AH.
//

import SwiftUICore
import UIKit



struct DailyAtndnceCard : View {
    
    @StateObject var viewModel = AdminDashbordViewModel()

    
    var body: some View {
        let totalWidth = UIScreen.main.bounds.width
        let spacing = 20.0
        let padding = 14.0 * 2
        let cardWidth = (totalWidth - (spacing + padding) ) / 2
        
        VStack{
            HStack(alignment: .top){
                VStack(alignment: .leading){
                    Text("Daily ")
                        .font(.title2)
                        .foregroundColor(.gray)
                    Text("Attandance")
                        .font(.title2)
                        .foregroundColor(.gray)
                }.padding(.leading)
               
                Spacer()
                Image(systemName: "gear")
                    .resizable()
                    .foregroundColor(Color("PrimaryRed"))
                    .frame(width: 25, height: 25)
            }


            HStack{
                Text("\(viewModel.dailyAtndnce)")
                    .font(.system(size: 34))
                    .foregroundColor(Color("PrimaryRed"))
                Image(systemName: "percent")
                    .resizable()
                    .foregroundColor(Color("PrimaryRed"))
                    .frame(width: 30, height: 30)
            }
            
        }
        .padding(.trailing, 8)
        .frame(width: cardWidth, height: 140)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .gray.opacity(0.1), radius: 3, x: 0, y: 1)
    }
}

