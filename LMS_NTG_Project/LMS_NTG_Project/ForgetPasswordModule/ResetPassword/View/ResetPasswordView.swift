//
//  ResetPasswordView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 05/02/1447 AH.
//

import SwiftUI

struct ResetPasswordView: View {
    var body: some View {
        
        NavigationStack {
            
            HeaderView(showFirstIcon: true, title: "Email Verification")
            
            VStack(spacing: 15) {
                 
                Spacer()
                    .frame(height: UIScreen.main.bounds.size.height * 0.18)
               
                Text("Enter New Password")
                    .font(.system(size: 22))
                    .padding(.bottom, 8)
                
                CustomTextField(labelText: "Password", iconName: "password", placeholder: "Enter your password", text: .constant(""))
                    .padding(.bottom)
                
                CustomTextField(labelText: "Confirm Password", iconName: "password", placeholder: "Confirm your password", text: .constant(""))
                
                Spacer()
                    .frame(height: UIScreen.main.bounds.size.height * 0.03)
                
                CustomButton(title: "Save") {}
                
                Spacer()
            }
            .padding(.horizontal, 40)
        }
    }
}

#Preview {
    ResetPasswordView()
}
