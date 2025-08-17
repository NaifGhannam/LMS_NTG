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
    @AppStorage("MyLanguages") var currentLanguage: String = Locale.current.language.languageCode?.identifier ?? "en"
    @EnvironmentObject var languageManager: LanguageManager
    @State private var isLanguageSelectionActive: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                // Header
                HeaderView(title: "profileTitle".localized(using: currentLanguage))
                
//                if viewModel.isLoading {
//                    ProgressView("Loading profile...")
//                        .padding()
//                } else if let error = viewModel.errorMessage {
//                    Text("Error: \(error)")
//                        .foregroundColor(.red)
//                        .padding()
//                } else if let profile = viewModel.profile {
                    // Profile Info
                    HStack {
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                            .padding(.leading)
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            HStack {

                                Text("\(profile.firstName ?? "null") \(profile.lastName ?? "null" )")
                                    .font(.headline)
                                
                                Button {
                                    print("Edit Profile")
                                } label: {
                                    Image("edit_profile")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                }
                            }
                            
//                            Text(profile.account?.email ?? "Email not set")
//                                .font(.subheadline)
//                                .foregroundColor(.gray)
                        }
                        .padding(.trailing, 60)
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    
                    // Divider
                    Rectangle()
                        .frame(height: 1)
                        .padding(.horizontal, 30)
                        .foregroundColor(Color("line_color"))
                    
                    // Settings Buttons
                    VStack {
                        settingsButton(image: "bell2", title: "notifications".localized(using: currentLanguage))
                        
                        NavigationLink(destination: ChooseLanguageView()
                            .environmentObject(languageManager)) {
                                settingsButton(image: "Language", title: "language".localized(using: currentLanguage))
                            }
                        
                        settingsButton(image: "password2", title: "changePassword".localized(using: currentLanguage))
                    }
                    .padding(20)
                    
                    // Logout
                    Button {
                        logoutViewModel.logout()
                    } label: {
                        Text("Logout")
                            .frame(maxWidth: .infinity)
                            .frame(height: 53)
                            .font(.headline)
                            .foregroundColor(.white)
                            .background(Color("PrimaryRed"))
                            .cornerRadius(10)
                    }
                    .navigationDestination(isPresented: $logoutViewModel.isLoggedOut) {
                        LoginView()
                    }
                    .padding(100)
                    
//                } else {
//                    Text("No profile data found")
//                        .padding()
//                }
                
                Spacer()
            }
            .task {
                // Load profile using saved userId from UserDefaults
                if let savedId = UserDefaults.standard.value(forKey: "userId") as? Int {
                    await viewModel.loadProfile(userId: savedId)
                } else {
                    viewModel.errorMessage = "⚠️ No userId found in UserDefaults"
                }
            }
        }
    }
    
    // Reusable settings button
    @ViewBuilder
    private func settingsButton(image: String, title: String) -> some View {
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
    }
}

#Preview {
    Profile(logoutViewModel: Login_ViewModel())
}
