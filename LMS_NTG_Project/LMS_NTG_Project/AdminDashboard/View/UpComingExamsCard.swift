//
//  UpComingExamsCard.swift
//  LMS_NTG_Project
//
//  Created by Naif on 11/02/1447 AH.
//

import SwiftUICore



struct UpComingExamsCard : View {
    @StateObject var viewModel = AdminDashbordViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            HStack{
                
                Text("Upcoming Exams")
                .font(.system(size: 20))
                .foregroundColor(.gray)
                  
                Spacer()
                Image(systemName: "gear")
                    .resizable()
                    .foregroundColor(Color("PrimaryRed"))
                    .frame(width: 25, height: 25)
            }
      
            Text("\(viewModel.count)")
                .font(.system(size: 40, weight: .bold))
            .foregroundColor(Color("PrimaryRed"))
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 10)
        .frame(height: 110)
        .background(Color.white)
            .cornerRadius(20)
            
           
    }
}
