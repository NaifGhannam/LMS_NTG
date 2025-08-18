//
//  LanguageManger.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 20/02/1447 AH.
//

import Foundation

class LanguageManager: ObservableObject {
    
    static let shared = LanguageManager()
    
    @Published var currentLanguage: String = UserDefaults.standard.string(forKey: "MyLanguages") ?? "en"

    func setLanguage(_ languageCode: String) {
        guard Bundle.main.localizations.contains(languageCode) else { return}
        UserDefaults.standard.set(languageCode, forKey: "MyLanguages")
        currentLanguage = languageCode
    }
    
    var supportedLanguages: [String] {
        return ["en", "ar"]
    }
    
    func languageDisplayName(_ languageCode: String) -> String {
        switch languageCode {
        case "ar":
            return "Arabic"
        case "en":
            return "English"
        default:
            return "Unknown"
        }
    }
    
    func languageFlagImageName(_ languageCode: String) -> String {
        switch languageCode {
        case "ar":
            return "saudi_flag"
        case "en":
            return "uk_flag"
        default:
            return ""
        }
    }
}
