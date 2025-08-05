//
//  Admin_dashoard.swift
//  LMS_NTG_Project
//
//  Created by Naif on 20/01/1447 AH.
//

import SwiftUI

struct Admin_dashoard: View {
    var body: some View {
        
        ZStack{
            
            Color("PrimaryLightGray")
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Admin Dashoard")
                        .font(.title)
                        .foregroundColor(Color("PrimaryRed"))
                        .bold()
                        .padding(.leading, 16)
                        
                    
                    Button{
                        
                    } label: {
                        HStack{
                            Text("Filter Date Range")
                                .font(.system(size: 22))
                                .foregroundColor(.gray)
                                .padding(.leading,20)
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color("PrimaryRed"))
                                .font(.system(size:25))
                                .padding(.trailing,8)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 10)
                        .frame(height: 50)
                        .background(Color.white)
                        .cornerRadius(16)
                        
                    }.padding(.bottom, 4)


                    
                    HStack (spacing: 12) {
                        UserCountCard()
                        DailyAtndnceCard()
                    }
                    
                    UpComingExamsCard()
                    
                    Spacer()
                        .frame(height: 30)
                    
                    RecentActivityView()
                }.padding(.horizontal,16)
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct UserCountCard : View {
    var userCount : Int = 1250
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
                    Text("\(userCount)")
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

struct DailyAtndnceCard : View {
    
    var dailyAtndnce : Int = 87
   
    
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
                Text("\(dailyAtndnce)")
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


struct UpComingExamsCard : View {
    var count: Int = 6
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
      
            Text("\(count)")
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
//    #Preview {
//        Admin_dashoard()
//    }

