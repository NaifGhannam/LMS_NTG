//
//  ChangePasswordView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 17/02/1447 AH.
//

import SwiftUI

struct ChangePasswordView: View {
    
    @StateObject private var viewModel = ChangePasswordViewModel()
    @State private var showPasswordMismatchError = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        NavigationStack {
            
            HeaderView(showFirstIcon: true, fAction: { dismiss() }, title: "Change Password")
            
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
                            
                            await viewModel.changePassword()
                            
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
                
                Text(viewModel.message ?? "")
                
                Spacer()
            }
            .padding(.horizontal, 40)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ChangePasswordView()
}
