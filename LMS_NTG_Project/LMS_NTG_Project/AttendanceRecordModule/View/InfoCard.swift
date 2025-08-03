//
//  InfoCard.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 28/01/1447 AH.
//

import SwiftUI

struct InfoCard: View {
    
    let title: String
    let value: String
    
    var body: some View {
        
        HStack {
            
            Text("\(title): \(value)")
                .font(.system(size: 18))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(20)
        .overlay {
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.primaryRed.opacity(0.3), lineWidth: 1)
                .shadow(color: .gray, radius: 4)
        }
    }
}
