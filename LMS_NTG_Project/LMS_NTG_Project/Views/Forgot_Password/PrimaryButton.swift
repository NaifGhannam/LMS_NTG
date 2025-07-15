//
//  PrimaryButton.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 20/01/1447 AH.
//

import SwiftUI

struct PrimaryButton: View {
    
    var title: String
    var action: (() -> ())?

    var body: some View {
        
        Button(action: {action?()}) {
            Text(title)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
                .padding(12)
                .frame(maxWidth: .infinity)
                .background(Color("PrimaryRed"))
                .cornerRadius(30)
        }
        .padding(.horizontal, 50)
    }
}

#Preview {
    PrimaryButton(title: "Title")
}
