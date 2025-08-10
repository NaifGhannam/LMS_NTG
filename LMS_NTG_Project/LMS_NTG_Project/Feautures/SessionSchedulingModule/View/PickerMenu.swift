//
//  PickerMenu.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 10/02/1447 AH.
//

import SwiftUI

struct PickerMenu<DataType: Hashable>: View {
    
    let title: String
    let placeholder: String
    let iconName: String?
    let options: [DataType]
    let getLabel: (DataType) -> String
    @Binding var selection: DataType?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 18))
            
            Menu {
                ForEach(options, id: \.self) { option in
                    Button(action: {
                        selection = option
                    }) {
                        Text(getLabel(option))
                    }
                }

            } label: {
                HStack {
                    Text(selection.map(getLabel) ?? placeholder)
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

