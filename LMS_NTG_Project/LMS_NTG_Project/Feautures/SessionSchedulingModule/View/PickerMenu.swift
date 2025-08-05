//
//  PickerMenu.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 10/02/1447 AH.
//

import SwiftUI

struct PickerMenu<T: RawRepresentable & CaseIterable & Identifiable>: View where T.RawValue == String {
    
    let title: String
    let placeholder: String
    let iconName: String?
    @Binding var selection: T?
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(title)
                .font(.system(size: 18))
            
            Menu {
                ForEach(Array(T.allCases)) { option in
                    Button(action: { selection = option }) {
                        Text(option.rawValue.capitalized)
                    }
                }
            } label: {
                HStack {
                    Text(selection?.rawValue.capitalized ?? placeholder)
                        .foregroundColor(selection == nil ? Color("TextGray") : .black)
                        .font(.system(size: 16))
                    
                    Spacer()
                    
                    if let iconName = iconName {
                        Image(iconName)
                            .resizable()
                            .frame(width: 22, height: 22)
                    }
                }
                .padding(14)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.primaryRed.opacity(0.5), lineWidth: 1)
                        .shadow(color: .black.opacity(0.25), radius: 5)
                )
                .cornerRadius(15)
            }
        }
    }
}
