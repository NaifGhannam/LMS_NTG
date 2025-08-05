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
                   // RecentActivityView()
                }.padding(.horizontal,16)
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

    #Preview {
        Admin_dashoard()
    }

