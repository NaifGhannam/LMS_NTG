//
//  ContentView.swift
//  LMS_NTG_Project
//
//  Created by Naif on 20/01/1447 AH.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var loc: AppLocalizationManager

    var body: some View {
        VStack(spacing: 24) {
            LanguageSwitcherView()

            // Text via Localizable.strings key
            Text("home_title")
                .font(.title.bold())

            // Interpolated/localized with arguments
            Text("greeting_name \( "John" )")

            // Manual one-off localization (rare; prefer Text keys)
            Text(loc.localized("one_off_tip"))

            // Direction-aware alignment (usually automatic, but here’s how if needed)
            Text("long_paragraph")
                .multilineTextAlignment(loc.layoutDirection == .rightToLeft ? .trailing : .leading)
                .padding(.horizontal)
        }
        .padding()
    }
}
