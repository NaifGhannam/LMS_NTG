//
//  IconTextField.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 20/01/1447 AH.
//

import SwiftUI

struct IconTextField: View {
    
    let systemImage: String
    let title: String
    @Binding var text: String
    @State var showPassword: Bool = false
    var isSecureField: Bool = false
    
    var body: some View {
        
        HStack(spacing: 10) {
            Image(systemName: systemImage)
                .foregroundColor(Color("PrimaryRed"))
                .font(.system(size: 30))
            
            Group {
                if isSecureField && !showPassword {
                    SecureField(title, text: $text)
                } else {
                    TextField(title, text: $text)
                }
            }
            
            if isSecureField {
                Button(action: {
                    showPassword.toggle()
                }) {
                    Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                        .foregroundColor(Color("PrimaryRed").opacity(0.5))
                }
            }
        }
        .padding(.horizontal)
        .frame(height: 50)
        .background(Color.white)
        .cornerRadius(30)
        .padding(.horizontal, 30)
    }
}

#Preview {
    IconTextField(systemImage: "person.circle", title: "Email", text: .constant(""))
        .padding(.vertical)
        .background(Color.gray)
}
