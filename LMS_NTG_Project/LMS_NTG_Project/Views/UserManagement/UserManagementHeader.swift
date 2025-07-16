//
//  UserManagementHeader.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 21/01/1447 AH.
//

import SwiftUI

struct UserManagementHeader: View {
    
    @Binding var searchText: String
    
    var body: some View {
        VStack {

            Rectangle()
                .fill(Color("PrimaryRed"))
                .frame(height: UIScreen.main.bounds.size.height * 0.24)
                .ignoresSafeArea(edges: .top)
                .overlay {

                    VStack {

                        Text("User Management")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .bold()

                        HStack(spacing: 12) {
                            
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .frame(width: 22, height: 22)
                                .padding(.leading)
                            
                            TextField("Search by name or email", text: $searchText)
                                .font(.system(size: 18))
                                .frame(height: 55)
                        }
                        .background(.white)
                        .cornerRadius(12)
                        .padding(.horizontal, 8)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 20)
                }
                .ignoresSafeArea()
            Spacer()
        }
    }
}

#Preview {
    UserManagementHeader(searchText: .constant(""))
}
