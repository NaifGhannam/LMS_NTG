//
//  UserMangementView.swift
//  LMS_NTG_Project
//
//  Created by Naif on 21/01/1447 AH.
//

import SwiftUI

struct UserMangementView: View {
    var body: some View {
       
        VStack{
            UserManagementHeader(searchText: .constant(""))
            
            ZStack {
                Color.gray.opacity(0.2)
                    .ignoresSafeArea()
                
                List(1 ... 10 , id: \.self ){
                    _ in
                    UserCard()
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))


                }
                .listStyle(PlainListStyle())
                .padding(.top, -69)
                
                
            }
            
           
        }
       
    }
}


#Preview {
    UserMangementView()
}
