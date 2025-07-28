//
//  UserMangementView.swift
//  LMS_NTG_Project
//
//  Created by Naif on 21/01/1447 AH.
//

import SwiftUI

struct UserMangementView: View {
    let users = Array(repeating: UserModel(name: "jenny Wilson", email: "Jenny.wilson@gmail.com", role: "admin", status: "Active"), count: 10)
    @State private var searchText = ""

    var body: some View {
            VStack(spacing: 0) {
                UserManagementHeader(searchText: $searchText)
                List(users) { user in
                    UserCard(user: user)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                }
                .listStyle(.plain)
            }.navigationBarHidden(true)
    }
}


#Preview {
    UserMangementView()
}
