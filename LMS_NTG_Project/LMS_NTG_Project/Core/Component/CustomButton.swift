//
//  CustomButton.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 04/02/1447 AH.
//

import SwiftUI

struct CustomButton: View {
    
    @State var title: String = "Title"
    @State var action: (() -> ())?
    
    var body: some View {
        
        Button(action: {action?()}) {
            
            Text(title)
                .foregroundColor(Color.white)
                .font(.system(size: 18, weight: .semibold))
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.primaryRed)
        .cornerRadius(10)
    }
}
