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
            List(1 ... 10 , id: \.self ){
                _ in
                UserCard()
            }.listStyle(PlainListStyle())
        }
       
    }
}


#Preview {
    UserMangementView()
}
