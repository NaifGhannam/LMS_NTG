//
//  CustomTextField.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 04/02/1447 AH.
//

import SwiftUI

struct CustomTextField: View {
    
    @State var labelText: String = "Label"
    @State var iconName: String = "mdi_email"
    @State var placeholder: String = "Placeholder text"
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            Text(labelText)
                .font(.system(size: 16))
                .foregroundColor(.black.opacity(0.70))
            
            HStack(spacing: 10) {
                
                Image(iconName)
                
                TextField(placeholder, text: .constant(""))
                
            }
            .padding()
            .overlay{
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black.opacity(0.17), lineWidth: 1)
            }
        }
    }
}
