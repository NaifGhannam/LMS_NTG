//
//  ChooseLanguageView.swift
//  LMS_NTG_Project
//
//  Created by Naif on 12/02/1447 AH.
//

import SwiftUI

struct ChooseLanguageView: View {
    
    @EnvironmentObject var languageManager: LanguageManager
    @AppStorage("MyLanguages") var currentLanguage: String =
        Locale.current.language.languageCode?.identifier ?? "en"
    @State private var selectedLanguageCode: String? = nil
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            HeaderView(showFirstIcon: true, fAction: { dismiss() }, title: "Choose Language")

            VStack {
                
                Text("Select your preferred language")
                    .font(.headline)
                    .foregroundStyle(.secondary)
                
                Spacer()
                    .frame(height: UIScreen.main.bounds.height * 0.05)

                HStack(spacing: 15) {
                    
                    if !languageManager.supportedLanguages.isEmpty {
                        
                        ForEach(languageManager.supportedLanguages, id: \.self) { code in
                            let isSelected = (selectedLanguageCode == code)

                            Button {
                                selectedLanguageCode = code
                            } label: {
                                ZStack {
                                    
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(.white)
                                        .shadow(color: .gray, radius: 5, x: 0, y: 4)
                                    
                                    VStack {
                                        
                                        HStack {
                                            
                                            Image(systemName: isSelected ? "checkmark.square.fill" : "square")
                                                .foregroundColor(.primaryRed)
                                                .imageScale(.large)
                                            Spacer()
                                        }

                                        Image(languageManager.languageFlagImageName(code))
                                        
                                        Text(languageManager.languageDisplayName(code))
                                            .foregroundColor(.black)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding(14)
                                    .background(isSelected ? Color.red.opacity(0.2) : Color.clear)
                                    .cornerRadius(15)
                                    .padding(5)
                                }
                            }
                            .frame(height: UIScreen.main.bounds.height * 0.15)
                        }
                    } else {
                        Text("No languages available")
                            .foregroundStyle(.secondary)
                    }
                }
                
                Spacer()
                    .frame(height: UIScreen.main.bounds.height * 0.15)
                
                Button {
                    let chosen = selectedLanguageCode ?? currentLanguage

                    languageManager.setLanguage(chosen)
                    currentLanguage = chosen
                    dismiss()
                } label: {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                        .frame(height: 53)
                        .font(.headline)
                        .foregroundColor(.white)
                        .background(Color("PrimaryRed"))
                        .cornerRadius(10)
                }

                Spacer()
            }
            .padding(.horizontal, 20)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            if selectedLanguageCode == nil {
                if languageManager.supportedLanguages.contains(currentLanguage) {
                    selectedLanguageCode = currentLanguage
                } else if languageManager.supportedLanguages.contains("en") {
                    selectedLanguageCode = "en"
                    languageManager.setLanguage("en")
                    currentLanguage = "en"
                } else {
                    selectedLanguageCode = languageManager.supportedLanguages.first
                }
            }
        }
    }
}

#Preview {
    ChooseLanguageView()
}
