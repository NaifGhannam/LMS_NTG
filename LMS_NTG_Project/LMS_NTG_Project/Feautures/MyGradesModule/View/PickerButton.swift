//
//  PickerButton.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 06/02/1447 AH.
//

import SwiftUI

struct PickerButton: View {
    
    @State var title: String = "Title"
    @State var action: (() -> ())?

    var body: some View {
        Button(action: {action?()}) {
            HStack {
                
                Text(title)
                    .font(.system(size: 16))
                    .foregroundStyle(.black.opacity(0.60))
                
                Spacer()
                
                Image("ion_chevron-back-outline-2")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            .padding(.horizontal)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity)
            .overlay {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.primaryRed.opacity(0.30), lineWidth: 1)
                    .shadow(color: .gray, radius: 3)
            }
        }
    }
}
