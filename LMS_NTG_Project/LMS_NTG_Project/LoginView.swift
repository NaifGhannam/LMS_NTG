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
            Color.red.edgesIgnoringSafeArea(.all)
            VStack{
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: .infinity, height: 600)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .ignoresSafeArea(.all)

                Spacer()
            }
            VStack{
                Image("NTG_LMS_LOGO")
                    .resizable()
                    .frame(width: 500, height: 250)
                    .padding(.top, 50)
                    .ignoresSafeArea(.all)
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
    
    var body: some View {
        
        Rectangle()
            .fill(Color.white)
            .frame(width: 350, height: 400)
            .cornerRadius(20)
            .overlay(
                VStack{
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(.red)
                        
                        TextField("Email", text: $email)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding()
                    
                    
                    HStack{
                        Image(systemName: "lock")
                            .foregroundColor(.red)
                    SecureField("Password",text: $password)
                }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .padding()
                    
                    HStack{
                     CustomCheckbox(isChecked: $rememberMe, label: "Remember Me")
                            .foregroundColor(Color.red)
                            .padding(.trailing)
                           
                        Text("Forgot Password?")
                            .foregroundColor(Color.red)
                            
                        
                    }
                    Button{
                        print("Login")
                    }label: {
                        Text("Login")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 320, height: 50)
                            .background(Color.red)
                            .cornerRadius(20)
                            .padding(.top, 10)
                    }
                    
                }
              
)

        
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



#Preview {
    LoginView()
}
