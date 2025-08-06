//
//  ChooseLanguageViewModel.swift
//  LMS_NTG_Project
//
//  Created by Naif on 12/02/1447 AH.
//

import Foundation

class ChooseLanguageViewModel : ObservableObject {
    @Published var selectedLanguage: AppLanguage = .english
      
      func saveLanguage() {
          UserDefaults.standard.set(selectedLanguage.rawValue, forKey: "AppLanguage")
      }
}
