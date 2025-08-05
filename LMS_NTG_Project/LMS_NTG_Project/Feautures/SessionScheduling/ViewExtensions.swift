//
//  File.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 02/02/1447 AH.
//

import SwiftUI

extension View {
    func inputStyle() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Color.white)
            .cornerRadius(6)
    }
}
