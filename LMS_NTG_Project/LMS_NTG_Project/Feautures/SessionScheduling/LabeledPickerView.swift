//
//  LabeledPickerView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 02/02/1447 AH.
//

import SwiftUI

struct LabeledPickerView<T: Hashable & Identifiable & RawRepresentable>: View where T.RawValue == String {
    
    let title: String
    let placeholder: String
    @Binding var selection: T
    let options: [T]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(title)
                .font(.system(size: 20))
            
            HStack {
                Text(placeholder)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.gray.opacity(0.5))
                
                Spacer()
                
                Picker("", selection: $selection) {
                    ForEach(options) { option in
                        Text(option.rawValue.capitalized).tag(option)
                    }
                }
                .tint(.black)
                .labelsHidden()
                .frame(height: 30)
            }
            .inputStyle()
        }
    }
}

