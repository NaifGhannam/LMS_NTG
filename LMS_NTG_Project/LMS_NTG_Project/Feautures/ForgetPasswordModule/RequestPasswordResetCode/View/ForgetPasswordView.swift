//
//  ForgetPasswordView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 03/02/1447 AH.
//

import SwiftUI

struct ForgetPasswordView: View {
    
    @StateObject private var viewModel = ForgetPasswordViewModel()
    @State private var shouldNavigate = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        NavigationStack {
            
            HeaderView(showFirstIcon: true, fAction: { dismiss() }, title: "Forgot Password")
            
            VStack(spacing: 15) {
                
                Spacer()
                    .frame(height: UIScreen.main.bounds.size.height * 0.18)
                
                Text("Mail Address Here")
                    .font(.system(size: 22))
                
                Text("Enter the email address associated \nwith your account")
                    .font(.system(size: 16))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black.opacity(0.55))
                
                CustomTextField(labelText: "Email", iconName: "mdi_email", placeholder: "Enter your email", text: $viewModel.email)
                    .padding(.bottom, 10)
                
                CustomButton(title: "Recover Password") {
                    Task {
                        let success = await viewModel.forgetPassword()
                        if success {
                            shouldNavigate = true
                        }
                    }
                }
                
                Spacer()
                
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else {
                    
                    if let error = viewModel.errorMessage {
                        
                        Text(error).foregroundColor(.red)
                    }
                }
                
                Text(viewModel.message ?? "")
                
                NavigationLink(
                    destination: VerifyResetCodeView(email: viewModel.email),
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

#Preview {
    ForgetPasswordView()
}
