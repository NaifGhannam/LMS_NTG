//
//  LMS_NTG_ProjectApp.swift
//  LMS_NTG_Project
//
//  Created by Naif on 20/01/1447 AH.
//

import SwiftUI

@main
struct LMS_NTG_ProjectApp: App {
    
    @StateObject var languageManager = LanguageManager.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                
                Profile(logoutViewModel: Login_ViewModel())
                    .environmentObject(languageManager)
            }
        }
    }
}
