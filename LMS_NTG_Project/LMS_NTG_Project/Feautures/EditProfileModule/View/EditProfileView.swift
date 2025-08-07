//
//  EditProfileView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 12/02/1447 AH.
//

import SwiftUI

struct EditProfileView: View {
    
    @State private var name: String = ""
    @State private var password: String = ""
    @State private var email: String = ""
    @State private var avatarImage: UIImage? = nil
    
    var body: some View {
        VStack {
            HeaderView(showFirstIcon: true, title: "Edit Profile")
            
            VStack(alignment: .leading) {
                
                EditProfileHeader(avatarImage: $avatarImage)
                
                Divider()
                    .background(Color.primaryRed)
                
                Text("PERSONAL DETAILS")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.black.opacity(0.5))
                    .padding(.vertical)
                
                Spacer()
                    .frame(height: 20)
                
                VStack(spacing: 20) {
                    
                    InputRow(
                        title: "Full Name",
                        placeholder: "Arthur Morgan",
                        text: $name
                    )
                    
                    Divider()
                        .background(Color.primaryRed)
                    
                    InputRow(
                        title: "Password",
                        placeholder: "****************",
                        text: $password
                    )
                    
                    Divider()
                        .background(Color.primaryRed)
                    
                    InputRow(
                        title: "Email address",
                        placeholder: "Arthur_Morgan_Mexico @gmail.com",
                        text: $email
                    )
                }
                
                Spacer()
                
                CustomButton(title: "Save")

                
            }
            .padding(.horizontal, 20)
            
            Spacer()
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    EditProfileView()
}

