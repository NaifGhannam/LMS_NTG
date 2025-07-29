//
//  LoginView.swift
//  LMS_NTG_Project
//
//  Created by NTG on 28/07/2025.
//

import SwiftUI

struct LoginViewLayer: View {
    @StateObject private var viewModel = LoginViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Text("Login").font(.largeTitle)

            TextField("Email", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)

            SecureField("Password", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)

            if viewModel.isLoading {
                ProgressView()
            } else {
                Button("Login") {
                    Task { await viewModel.login() }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }

            if let error = viewModel.errorMessage {
                Text(error).foregroundColor(.red)
            }

            Spacer()
        }
        .padding()
    }
}
