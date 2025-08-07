//
//  ResetPasswordView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 05/02/1447 AH.
//

import SwiftUI

struct ResetPasswordView: View {
    
    @StateObject private var viewModel = ResetPasswordViewModel()
    @State private var showPasswordMismatchError = false
    @State private var shouldNavigate = false
    @Environment(\.dismiss) private var dismiss
    
    let email: String
    let code: String
    
    var body: some View {
        
        NavigationStack {
            
            HeaderView(showFirstIcon: true, fAction: { dismiss() }, title: "Email Verification")
            
            VStack(spacing: 15) {
                
                Spacer()
                    .frame(height: UIScreen.main.bounds.size.height * 0.18)
                
                Text("Enter New Password")
                    .font(.system(size: 22))
                    .padding(.bottom, 8)
                
                CustomTextField(labelText: "Password", iconName: "password", placeholder: "Enter your password", text: $viewModel.newPassword)
                    .padding(.bottom)
                
                CustomTextField(labelText: "Confirm Password", iconName: "password", placeholder: "Confirm your password", text: $viewModel.confirmNewPassword)
                
                Spacer()
                    .frame(height: UIScreen.main.bounds.size.height * 0.03)
                
                CustomButton(title: "Save") {
                    if viewModel.newPassword == viewModel.confirmNewPassword {
                        showPasswordMismatchError = false
                        
                        Task {
                            
                            let success = await viewModel.resetPassword(email: email, verificationCode: code)
                            if success {
                                shouldNavigate = true
                            }
                        }
                    } else {
                        showPasswordMismatchError = true
                    }
                }
                
                if showPasswordMismatchError {
                    Text("Passwords do not match")
                        .foregroundColor(.red)
                }
                
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else {
                    
                    if let error = viewModel.errorMessage {
                        
                        Text(error).foregroundColor(.red)
                    }
                }
                
                NavigationLink(
                    destination: LoginView(),
                    isActive: $shouldNavigate,
                    label: { EmptyView() }
                )
                .hidden()
                
                Spacer()
            }
            .padding(.horizontal, 40)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

