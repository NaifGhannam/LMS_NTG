//
//  InputRow.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 12/02/1447 AH.
//

import SwiftUI

struct InputRow: View {
    
    let title: String
    let placeholder: String
    @Binding var text: String

    var body: some View {
        
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 15, weight: .medium))

            HStack {
                TextField(placeholder, text: $text)
                    
                
                Spacer()

                Image("GroupEdit")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            .padding(14)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.black.opacity(0.25), lineWidth: 1)
            }
            .cornerRadius(10)
            .padding(.bottom, 10)
        }
    }
}
