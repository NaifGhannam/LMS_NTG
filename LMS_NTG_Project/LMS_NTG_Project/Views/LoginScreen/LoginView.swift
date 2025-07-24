//
//  LoginView.swift
//  LMS_NTG_Project
//
//  Created by Naif on 20/01/1447 AH.
//

import SwiftUI

struct LoginView: View {
    
    var body: some View {
        
        ZStack{
            Color("PrimaryRed").edgesIgnoringSafeArea(.all)
            VStack {
                Rectangle()
                    .fill(Color("PrimaryLightGray"))
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: UIScreen.main.bounds.height * 0.65
                    )
                    .cornerRadius(20)
                    .ignoresSafeArea(.all)
                Spacer()
            }
            VStack{
                Image("NTG_LMS_LOGO")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.3)
                loginBox()
                Spacer()
            }
        }
        
        
    }
}





struct loginBox: View {
    
    @State private var email: String = ""
    @State private var password : String = ""
    @State private var rememberMe : Bool = false
    @State private var showPassword: Bool = false
    
    var body: some View {
        VStack() {
            // Email Field
            HStack {
                Image(systemName: "person.fill")
                    .foregroundColor(Color("PrimaryRed"))
                
                TextField("Email", text: $email)
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color(red: 0.95, green: 0.92, blue: 0.92)) // light gray
            .cornerRadius(25)
            .padding(.horizontal)
            .padding(.top, 30)
            
            // Password Field
            HStack {
                Image(systemName: "lock.fill")
                    .foregroundColor(Color("PrimaryRed"))
                
                Group {
                    if showPassword {
                        TextField("Password", text: $password)
                    } else {
                        SecureField("Password", text: $password)
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
                
                NavigationLink (destination: ForgotPasswordView()) {
                    Text("Forgot Password?")
                        .foregroundColor(Color("PrimaryRed"))
                        .font(.footnote)
                }
                
            }
            .padding(.horizontal, 30)
            .padding(.top, 10)
            
            // Login Button
            //Admin_dashoard
            NavigationLink(destination: MainTabView()) {
                Text("Login")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(Color("PrimaryRed"))
                    .cornerRadius(25)
            }
            .padding(.horizontal)
            .padding(.bottom, 26)
        }
        .padding(.vertical)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .gray.opacity(0.2), radius: 10, x: 0, y: 4)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 10)
        
    }
}




struct CustomCheckbox: View {
    @Binding var isChecked: Bool
    var label: String
    
    var body: some View {
        HStack {
            Button(action: {
                isChecked.toggle()
            }) {
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                    .foregroundColor(isChecked ? .blue : .gray)
                    .font(.system(size: 24))
            }
            Text(label)
                .font(.subheadline)
        }
    }
}



//#Preview {
//    LoginView()
//}
