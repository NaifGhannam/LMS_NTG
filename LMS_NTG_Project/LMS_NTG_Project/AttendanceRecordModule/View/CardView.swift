//
//  CardView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 09/02/1447 AH.
//

import SwiftUI

struct CardView<Content: View>: View {
    
    let content: Content
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        
        content
            .padding()
            .background(.white)
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.25), radius: 5, x: 0, y: 4)
    }
}
