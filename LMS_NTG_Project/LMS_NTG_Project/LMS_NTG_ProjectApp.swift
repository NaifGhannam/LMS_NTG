//
//  LMS_NTG_ProjectApp.swift
//  LMS_NTG_Project
//
//  Created by Naif on 20/01/1447 AH.
//

//import SwiftUI
//
//@main
//struct LMS_NTG_ProjectApp: App {
//    @StateObject private var loc = AppLocalizationManager.shared
//
//    var body: some Scene {
//        WindowGroup {
//            NavigationStack {
//                if UserDefaults.standard.bool(forKey: "isLoggedIn") {
//                        MainTabView()
//                }
//                else {
//                    LoginView()
//                }
//            }
//            
//            
//        }
//    }
//}


import SwiftUI

//@main
//struct LMS_NTG_ProjectApp: App {
//    @StateObject private var loc = AppLocalizationManager.shared
//
//    var body: some Scene {
//        WindowGroup {
//            NavigationStack {
//                if UserDefaults.standard.bool(forKey: "isLoggedIn") {
//                    MainTabView()
//                } else {
//                    LoginView()
//                }
//            }
//            .environmentObject(loc)          // <- add
//            .withAppLocalization(loc)        // <- add (sets locale + RTL/LTR)
//        }
//    }
//}


@main
struct LMS_NTG_ProjectApp: App {
    @StateObject private var loc = AppLocalizationManager.shared

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                if UserDefaults.standard.bool(forKey: "isLoggedIn") {
                    MainTabView()
                } else {
                    LoginView()
                }
            }
            .environmentObject(loc)
            .withAppLocalization(loc) // sets locale + RTL/LTR globally
        }
    }
}
