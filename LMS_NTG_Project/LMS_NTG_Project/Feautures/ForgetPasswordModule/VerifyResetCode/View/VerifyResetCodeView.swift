//
//  VerifyResetCodeView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 04/02/1447 AH.
//

import SwiftUI

struct VerifyResetCodeView: View {
    
    @StateObject private var viewModel = VerifyResetCodeViewModel()
    @State private var shouldNavigate = false
    let email: String
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        NavigationStack {
            
            HeaderView(showFirstIcon: true, fAction: { dismiss() }, title: "Email Verification")
            
            VStack(spacing: 15) {
                 
                Spacer()
                    .frame(height: UIScreen.main.bounds.size.height * 0.18)
               
                Text("Get Your Code")
                    .font(.system(size: 22))
                
                Text("Please enter the 6 digit code that \nsent to your email address")
                    .font(.system(size: 16))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black.opacity(0.55))
                
                OTPTextField(numberOfFields: 6, enteredOTP: $viewModel.code)
                    .padding(.top, 20)
                
                HStack {
                    Text("If you didn't receive code!")
                        .foregroundColor(.black.opacity(0.50))
                    Button(action: {}) {
                        Text("Resend")
                            .foregroundColor(.primaryRed)
                    }
                }
                .font(.system(size: 12))
                
                CustomButton(title: "Verify and Proceed") {
                    Task {
                        let success =  await viewModel.verifyResetCode(email: email)
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
                
                NavigationLink(
                    destination: ResetPasswordView(email: email, code: viewModel.code),
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



