//
//  ActionButton.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 02/02/1447 AH.
//

import SwiftUI

struct ActionButton: View {
    
    var title: String
    var backgroundColor: Color
    var action: (() -> ())?
    
    var body: some View {
        Button(action: {action?()}) {
            Text(title)
                .font(.system(size: 20))
                .foregroundColor(.white)
                .frame(width: 125)
                .padding(20)
                .background(backgroundColor)
                .cornerRadius(6)
        }
    }
}
