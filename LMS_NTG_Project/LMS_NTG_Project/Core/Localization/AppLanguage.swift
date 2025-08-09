//
//  AppLanguage.swift
//  LMS_NTG_Project
//
//  Created by NTG on 09/08/2025.
//

import SwiftUI
import Combine

enum AppLanguage: String, CaseIterable, Identifiable {
    case en, ar
    var id: String { rawValue }

    var locale: Locale { Locale(identifier: rawValue) }

    var layoutDirection: LayoutDirection {
        switch self {
        case .ar: return .rightToLeft
        case .en: return .leftToRight
        }
    }

    var displayName: String {
        switch self {
        case .en: return "English"
        case .ar: return "العربية"
        }
    }
}
