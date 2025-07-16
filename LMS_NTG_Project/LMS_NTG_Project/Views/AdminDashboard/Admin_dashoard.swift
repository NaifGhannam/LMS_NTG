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
            Color.gray
                .opacity(0.3)
                .ignoresSafeArea()
            ScrollView {
                VStack{
                    Text("Admin Dashoard")
                        .font(.title)
                        .foregroundColor(Color("PrimaryRed"))
                        .padding(.trailing, 150)
                        .bold()
                        
                    
                    Button{
                        
                    } label: {
                        HStack{
                            Text("Filter Date Range")
                                .font(.system(size: 25 , weight: .medium))
                                .font(.headline)
                                .foregroundColor(.gray)
                                .padding(.trailing ,70)
                            
                            
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color("PrimaryRed"))
                                .font(.system(size:25))
                            
                        }
                        .frame(width: 370, height: 70)
                        .background(Color.white)
                        .cornerRadius(10)
                        
                        
                    }
                    
                    HStack {
                        UserCountCard()
                        DailyAtndnceCard()
                    }
                    UpComingExamsCard()
                    
                    Spacer()
                    
                    RecentActivityView()
                }
            }
        }
    }
}

struct UserCountCard : View {
    var userCount : Int = 1250
    var body: some View {
        VStack{
            
            Text("user count")
                .font(.title2)
                .foregroundColor(.gray)
                .alignmentGuide(.top) { $0[.bottom] }
            
            HStack{
                Text("\(userCount)")
                    .font(.system(size: 30, weight: .bold, design: .default))
                    .padding()
                    .foregroundColor(Color("PrimaryRed"))
                    .alignmentGuide(.top) { $0[.bottom] }
                    
                
                Image(systemName: "person.fill.badge.plus")
                    .resizable()
                    .foregroundColor(Color("PrimaryRed"))
                    .frame(width: 30, height: 30)
                    
                    
            }
            
        }
        .frame(width: 180, height: 150)
        .background(Color.white)
            .cornerRadius(20)
    }
}

struct DailyAtndnceCard : View {
    
    var dailyAtndnce : Int = 87
    var body: some View {
        VStack{
            HStack{
                
                VStack(alignment: .leading){
                    Text("Daily ")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .alignmentGuide(.top) { $0[.bottom] }
                    Text("Atndnce")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .alignmentGuide(.top) { $0[.bottom] }
                    
                }.padding(.leading)
               
                
                Image(systemName: "gear")
                    .resizable()
                    .foregroundColor(Color("PrimaryRed"))
                    .frame(width: 30, height: 30)
                    .padding(.trailing)
            }
            HStack{
                Text("\(dailyAtndnce)")
                    .font(.system(size: 30, weight: .bold, design: .default))
                    .padding()
                    .foregroundColor(Color("PrimaryRed"))
                    .alignmentGuide(.top) { $0[.bottom] }
                    
                
                Image(systemName: "percent")
                    .resizable()
                    .foregroundColor(Color("PrimaryRed"))
                    .frame(width: 30, height: 30)
                    
                    
            }
            
        }
        .frame(width: 180, height: 150)
        .background(Color.white)
            .cornerRadius(20)
    }
}


struct UpComingExamsCard : View {
    var count: Int = 6
    var body: some View {
        VStack{
            HStack{
                
                    Text("Upcoming Exams")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .alignmentGuide(.top) { $0[.bottom] }
                        .padding(.trailing , 140)
                        .padding(.top , 10)
                  
                Image(systemName: "gear")
                    .resizable()
                    .foregroundColor(Color("PrimaryRed"))
                    .frame(width: 30, height: 30)
                    .padding(.top , 20)
            }
      
                Text("\(count)")
                    .font(.system(size: 30, weight: .bold, design: .default))
                    .foregroundColor(Color("PrimaryRed"))
                    .alignmentGuide(.leading) { $0[.bottom]}
                    .padding(.trailing , 300)
                    

            
        }
        .frame(width: 370, height: 110)
        .background(Color.white)
            .cornerRadius(20)
            
           
    }
}
    #Preview {
        Admin_dashoard()
    }

