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
        VStack(spacing: 16) {
            Text("User Management")
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(.white)

            // Code Review: Use Search Component
            HStack(spacing: 12) {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
                    .padding(.leading)

                TextField("Search by name or email", text: $searchText)
                    .font(.system(size: 18))
                    .frame(height: 50)
            }
            .background(Color(.systemGray6))
            .clipShape(Capsule())
            .padding(.horizontal)
        }
        .padding(.bottom)
        .frame(maxWidth: .infinity)
        .background(Color("PrimaryRed"))
    }
}


#Preview {
    UserManagementHeader(searchText: .constant(""))
}
