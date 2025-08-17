//
//  Profile.swift
//  LMS_NTG_Project
//
//  Created by Naif on 09/02/1447 AH.
//
import SwiftUI

struct Profile: View {
    
    @ObservedObject var logoutViewModel: Login_ViewModel
    @StateObject private var viewModel = ProfileViewModel()
    @EnvironmentObject var languageManager: LanguageManager
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            
            HeaderView(title: "profileTitle".localized(using: languageManager.currentLanguage))
            
            if viewModel.isLoading {
                ProgressView("loadingProfile".localized(using: languageManager.currentLanguage))
                    .padding()
            } else if let error = viewModel.errorMessage {
                Text("⚠️ \(error)")
                    .foregroundColor(.red)
                    .padding()
            } else if let profile = viewModel.profile {
                
                HStack {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .clipShape(Circle())
                        .padding(.leading)
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("\(profile.firstName ?? "null") \(profile.lastName ?? "null")")
                                .font(.headline)
                            
                            Button {
                                print("Edit Profile tapped")
                            } label: {
                                Image("edit_profile")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                            }
                        }
                        
                        Text(profile.account?.email ?? "emailNotSet".localized(using: languageManager.currentLanguage))
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 60)
                }
                .padding(20)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                
                Rectangle()
                    .frame(height: 1)
                    .padding(.horizontal, 30)
                    .foregroundColor(Color("line_color"))
                
                VStack(spacing: 15) {
                    settingsButton(image: "bell2", title: "notifications".localized(using: languageManager.currentLanguage)) {
                        print("Notifications tapped")
                    }
                    
                    NavigationLink(destination:
                                    ChooseLanguageView()
                                    .environmentObject(languageManager)
                    ) {
                        settingsButtonView(image: "Language", title: "language".localized(using: languageManager.currentLanguage))
                    }
                    
                    settingsButton(image: "password2", title: "changePassword".localized(using: languageManager.currentLanguage)) {
                        print("Change password tapped")
                    }
                }
                .padding(20)
                
                Button {
                    logoutViewModel.logout()
                } label: {
                    Text("logout".localized(using: languageManager.currentLanguage))
                        .frame(maxWidth: .infinity)
                        .frame(height: 53)
                        .font(.headline)
                        .foregroundColor(.white)
                        .background(Color("PrimaryRed"))
                        .cornerRadius(10)
                }
                .navigationDestination(isPresented: $logoutViewModel.isLoggedOut) {
                    LoginView()
                        .environmentObject(languageManager)
                }
                .padding(100)
                
            } else {
                Text("noProfileData".localized(using: languageManager.currentLanguage))
                    .padding()
            }
            
            Spacer()
        }
        .task {
            if let savedId = UserDefaults.standard.value(forKey: "userId") as? Int {
                await viewModel.loadProfile(userId: savedId)
            } else {
                viewModel.errorMessage = "⚠️ No userId found in UserDefaults"
            }
        }
    }
    
    // MARK: - Helper Views
    @ViewBuilder
    private func settingsButton(image: String, title: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                Image(image)
                    .foregroundStyle(.black)
                    .font(.system(size: 20, weight: .regular))
                Text(title)
                    .foregroundStyle(.black)
                    .font(.system(size: 18, weight: .regular))
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(.black)
                    .font(.system(size: 20, weight: .regular))
            }
            .frame(height: 50)
            .padding(.horizontal)
        }
    }
    
    @ViewBuilder
    private func settingsButtonView(image: String, title: String) -> some View {
        HStack {
            Image(image)
                .foregroundStyle(.black)
                .font(.system(size: 20, weight: .regular))
            Text(title)
                .foregroundStyle(.black)
                .font(.system(size: 18, weight: .regular))
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(.black)
                .font(.system(size: 20, weight: .regular))
        }
        .frame(height: 50)
        .padding(.horizontal)
    }
}
