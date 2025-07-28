//
//  UserCard.swift
//  LMS_NTG_Project
//
//  Created by Naif on 21/01/1447 AH.
//

import SwiftUI

struct UserCard: View {
    let user: UserModel

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(user.name)
                        .font(.headline)
                        .foregroundColor(.black)

                    Text(user.email)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

                Spacer()

                HStack(spacing: 16) {
                    Button(action: {
                        // Edit action
                    }) {
                        Image(systemName: "pencil")
                            .foregroundColor(.black)
                    }

                    Button(action: {
                        // Delete action
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                }
            }

            HStack(spacing: 10) {
                Text(user.role)
                    .font(.caption)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)

                Text(user.status)
                    .font(.caption)
                    .foregroundColor(.green)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.green.opacity(0.2))
                    .cornerRadius(10)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}
