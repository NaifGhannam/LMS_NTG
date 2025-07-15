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
    
    var body: some View {
        
        HStack(spacing: 10) {
            Image(systemName: systemImage)
                .foregroundColor(Color("PrimaryRed"))
                .font(.system(size: 30))
            
            TextField(title, text: $text)
                .autocapitalization(.none)
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
