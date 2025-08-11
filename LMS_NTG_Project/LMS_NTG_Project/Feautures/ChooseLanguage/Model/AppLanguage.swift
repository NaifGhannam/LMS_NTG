//
//  AppLanguage.swift
//  LMS_NTG_Project
//
//  Created by Naif on 12/02/1447 AH.
//


enum AppLanguage: String, CaseIterable, Identifiable {
    case arabic = "Arabic"
    case english = "English"
    
    var id: String { self.rawValue }
    
    var flagImageName: String {
        switch self {
        case .arabic: return "saudi_flag"
        case .english: return "uk_flag"
        }
    }
}
