//
//  LanguageSwitcherView.swift
//  LMS_NTG_Project
//
//  Created by NTG on 09/08/2025.
//

import SwiftUI

struct LanguageSwitcherView: View {
    @EnvironmentObject var loc: AppLocalizationManager

    var body: some View {
        HStack(spacing: 12) {
            Button {
                loc.language = .en
            } label: {
                Text("English")
                    .padding(.horizontal, 14).padding(.vertical, 10)
                    .background(loc.language == .en ? .blue.opacity(0.15) : .gray.opacity(0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }

            Button {
                loc.language = .ar
            } label: {
                Text("العربية")
                    .padding(.horizontal, 14).padding(.vertical, 10)
                    .background(loc.language == .ar ? .blue.opacity(0.15) : .gray.opacity(0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
        .animation(.easeInOut, value: loc.language)
    }
}
