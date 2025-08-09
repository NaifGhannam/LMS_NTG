//
//  AppLocalizationManager.swift
//  LMS_NTG_Project
//
//  Created by NTG on 09/08/2025.
//

import SwiftUI
import Combine

//final class AppLocalizationManager: ObservableObject {
//    static let shared = AppLocalizationManager()
//
//    @AppStorage("appLanguage") private var storedCode: String = Locale.current.language.languageCode?.identifier ?? "en" {
//        didSet { objectWillChange.send() }
//    }
//
//    var language: AppLanguage {
//        get { AppLanguage(rawValue: storedCode) ?? .en }
//        set {
//            guard storedCode != newValue.rawValue else { return }
//            storedCode = newValue.rawValue
//        }
//    }
//
//    var locale: Locale { language.locale }
//    var layoutDirection: LayoutDirection { language.layoutDirection }
//
//    /// Helper for manual one-off strings that aren't in `Text("key")`.
//    func localized(_ key: String, table: String? = nil) -> String {
//        let bundle = Bundle.localizedBundle(for: language)
//        return NSLocalizedString(key, tableName: table, bundle: bundle, value: key, comment: "")
//    }
//}


final class AppLocalizationManager: ObservableObject {
    static let shared = AppLocalizationManager()

    // Default to English on first launch
    @AppStorage("appLanguage") private var storedCode: String = "ar" {
        didSet { objectWillChange.send() }
    }

    var language: AppLanguage {
        get { AppLanguage(rawValue: storedCode) ?? .ar }
//        get{.ar}
        set { if storedCode != newValue.rawValue { storedCode = newValue.rawValue } }
    }

    var locale: Locale { language.locale }
    var layoutDirection: LayoutDirection { language.layoutDirection }

    func localized(_ key: String, table: String? = nil) -> String {
        let bundle = Bundle.localizedBundle(for: language)
        return NSLocalizedString(key, tableName: table, bundle: bundle, value: key, comment: "")
    }
}


private extension Bundle {
    /// Load the language-specific bundle (avoids app restart when switching)
    static func localizedBundle(for language: AppLanguage) -> Bundle {
        guard
            let path = Bundle.main.path(forResource: language.rawValue, ofType: "lproj"),
            let bundle = Bundle(path: path)
        else { return .main }
        return bundle
    }
}
