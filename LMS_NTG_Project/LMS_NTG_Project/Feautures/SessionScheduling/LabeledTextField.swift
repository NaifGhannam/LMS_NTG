//
//  LabeledTextField.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 02/02/1447 AH.
//

import SwiftUI

struct LabeledTextField: View {
    
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(title)
                .font(.system(size: 20))
            
            TextField(placeholder, text: $text)
                .font(.system(size: 16, weight: .medium))
                .padding(.vertical, 4)
                .inputStyle()
        }
    }
}
