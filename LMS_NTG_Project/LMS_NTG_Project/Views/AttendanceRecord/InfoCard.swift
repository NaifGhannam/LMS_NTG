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
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
    }
}
