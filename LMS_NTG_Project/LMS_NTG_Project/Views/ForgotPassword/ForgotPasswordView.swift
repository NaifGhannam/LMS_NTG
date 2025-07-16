//
//  ForgotPasswordView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 20/01/1447 AH.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
    
                
        ZStack(alignment: .top) {
                    Color("LightGray")
                        .ignoresSafeArea() // ensures full background

                    VStack(spacing: 25) {
                        ForgotPasswordHeader(action: { dismiss() })
                        Spacer()
                Image(systemName: "lock.shield")
                    .resizable()
                    .frame(width: 90, height: 100)
                    .foregroundColor(Color("PrimaryRed"))
                
                Text("Trouble Logging in?")
                    .font(.system(size: 20, weight: .bold))
                
                Text("Enter your email and we'll send you \na link to reset your password.")
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                
                
                IconTextField(systemImage: "person.circle", title: "Email", text: $email)
                
                IconTextField(systemImage: "lock", title: "Password", text: $password)
                
                IconTextField(systemImage: "lock", title: "Confirm Password", text: $confirmPassword, isSecureField: true)
                
                PrimaryButton(title: "Reset Password")

                Spacer()
            }
        }
        .background(Color("LightGray").ignoresSafeArea()) // ✅ This ensures full coverage

        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

//#Preview {
//    ForgotPasswordView()
//}
