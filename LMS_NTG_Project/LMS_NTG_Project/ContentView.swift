//
//  ContentView.swift
//  LMS_NTG_Project
//
//  Created by Naif on 20/01/1447 AH.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("MyLanguages") var currentLanguage: String = Locale.current.language.languageCode?.identifier ?? "en"
    @EnvironmentObject var languageManager: LanguageManager
    @State private var isLanguageSelectionActive: Bool = false
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                Text("welcomMessage".localized(using: currentLanguage))
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 20)
                
                Button(action: { isLanguageSelectionActive = true }) {
                    Text("changeLanguage".localized(using: currentLanguage))
                }
                .sheet(isPresented: $isLanguageSelectionActive) {
                    LanguageSelectionView()
                        .environmentObject(languageManager)
                }
                .padding(20)
            }
            .padding()
            .navigationTitle("appTitle".localized(using: currentLanguage))
        }
    }
}

#Preview {
    ContentView()
}
