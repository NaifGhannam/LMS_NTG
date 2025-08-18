//
//  LanguageSelectionView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 20/02/1447 AH.
//

import SwiftUI

struct LanguageSelectionView: View {
    
    @EnvironmentObject var languageManager: LanguageManager
    @AppStorage("MyLanguages") var currentLanguage: String = Locale.current.language.languageCode?.identifier ?? "en"
    @State private var selectedLanguageIndex = 0
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("changeLanguage".localized(using: currentLanguage))
                    .font(.title2)
                    .bold()
                    .padding(.top, 20)
                
                List {
                    if languageManager.supportedLanguages.count > 0 {
                        ForEach(0..<languageManager.supportedLanguages.count, id: \.self) { index in
                            
                            Button(action: {
                                
                                let languageCode = self.languageManager.supportedLanguages[index]
                                languageManager.setLanguage(languageCode)
                                currentLanguage = languageCode
                                selectedLanguageIndex = index
                                self.presentationMode.wrappedValue.dismiss()
                            }) {
                                
                                HStack {
                                    Text(languageManager.languageDisplayName(languageManager.supportedLanguages[index]))
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    
                                    Spacer()
                                    
                                    if selectedLanguageIndex == index {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.green)
                                            .imageScale(.large)
                                    } else {
                                        Image(systemName: "circle")
                                            .foregroundColor(.secondary)
                                            .imageScale(.large)
                                    }
                                }
                                .padding(.vertical, 10)
                            }
                        }
                        .onAppear {
                            
                            if let index = self.languageManager.supportedLanguages.firstIndex(of: self.currentLanguage) {
                                self.selectedLanguageIndex = index
                            } else {
                                let defaultLanguage = "en"
                                if let defaultIndex = self.languageManager.supportedLanguages.firstIndex(of: defaultLanguage) {
                                    selectedLanguageIndex = defaultIndex
                                    currentLanguage = defaultLanguage
                                    languageManager.setLanguage(defaultLanguage)
                                }
                            }
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
                
                Spacer()
            }
            .navigationTitle("languageSelection".localized(using: currentLanguage))
        }
    }
}
