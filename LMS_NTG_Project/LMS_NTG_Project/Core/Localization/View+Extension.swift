//
//  View+Extension.swift
//  LMS_NTG_Project
//
//  Created by NTG on 09/08/2025.
//

import SwiftUI

extension View {
    func withAppLocalization(_ manager: AppLocalizationManager) -> some View {
        self
            .environment(\.locale, manager.locale)
            .environment(\.layoutDirection, manager.layoutDirection)
    }
}
