//
//  loginBox.swift
//  LMS_NTG_Project
//
//  Created by Naif on 11/02/1447 AH.
//

import SwiftUI



struct loginBox: View {
    @StateObject var viewModel: Login_ViewModel
    @State private var rememberMe = false
    @State private var showPassword = false

    var body: some View {
        NavigationStack{
            VStack {
                // Email Field
                HStack {
                    Image(systemName: "person.fill")
                        .foregroundColor(Color("PrimaryRed"))
                    
                    TextField("Email", text: $viewModel.email)
                        .onChange(of: viewModel.email) { _ in
                            viewModel.errorMessage = nil}
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color(red: 0.95, green: 0.92, blue: 0.92))
                .cornerRadius(25)
                .padding(.horizontal)
                .padding(.top, 30)
                
                // Password Field
                HStack {
                    Image(systemName: "lock.fill")
                        .foregroundColor(Color("PrimaryRed"))
                    
                    Group {
                        if showPassword {
                            TextField("Password", text: $viewModel.password)
                                .onChange(of: viewModel.password) { _ in
                                    viewModel.errorMessage = nil
                                }
                        } else {
                            SecureField("Password", text: $viewModel.password)
                                .onChange(of: viewModel.password) { _ in
                                    viewModel.errorMessage = nil
                                }
                        }
                    }
                    .foregroundColor(.gray)
                    
                    Button(action: {
                        showPassword.toggle()
                    }) {
                        Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(.red.opacity(0.6))
                    }
                }
                .padding()
                .background(Color(red: 0.95, green: 0.92, blue: 0.92))
                .cornerRadius(25)
                .padding(.horizontal)
                .padding(.top, 30)
                .padding(.bottom, 10)
                
                // Remember Me & Forgot Password
                HStack {
                    HStack(spacing: 5) {
                        Button(action: {
                            rememberMe.toggle()
                        }) {
                            Image(systemName: rememberMe ? "checkmark.square.fill" : "square")
                                .foregroundColor(Color("PrimaryRed"))
                        }
                        Text("Remember Me")
                            .foregroundColor(Color("PrimaryRed"))
                            .font(.footnote)
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: ForgotPasswordView()) {
                        Text("Forgot Password?")
                            .foregroundColor(Color("PrimaryRed"))
                            .font(.footnote)
                    }
                }
                .padding(.horizontal, 30)
                .padding(.top, 10)
                
                // Login Button
                Button(action: {
                    Task {
                        await viewModel.login()
                    }
                }) {
                    Text("Login")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color("PrimaryRed"))
                        .cornerRadius(25)
                }
                .navigationDestination(isPresented: $viewModel.isLoggedIn) {
                    MainTabView()}
                .padding(.horizontal)
                .padding(.bottom, 10)
                
                
                // Error Message
                if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.footnote)
                        .padding(.bottom, 10)
                }
                
                
            }
            .padding(.vertical)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: .gray.opacity(0.2), radius: 10, x: 0, y: 4)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 10)
        }}
}
      

