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
    
    var body: some View {
        NavigationStack {
            VStack {
                // Header
                HeaderView(title: "Profile & Settings")
                
                if viewModel.isLoading {
                    ProgressView("Loading profile...")
                        .padding()
                } else if let error = viewModel.errorMessage {
                    Text("Error: \(error)")
                        .foregroundColor(.red)
                        .padding()
                } else if let profile = viewModel.profile {
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
                                Text("\(profile.firstName) \(profile.lastName)")
                                    .font(.headline)
                                
                                Button {
                                    print("Edit Profile")
                                } label: {
                                    Image("edit_profile")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                }
                            }
                            
                            Text(profile.account.email)
                                .font(.subheadline)
                                .foregroundColor(.gray)
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
                        settingsButton(image: "bell2", title: "Notifications") {
                            print("Notifications")
                        }
                        settingsButton(image: "Language", title: "Language") {
                            print("Language")
                        }
                        settingsButton(image: "password2", title: "Change password") {
                            print("Change password")
                        }
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
                    
                } else {
                    Text("No profile data found")
                        .padding()
                }
                
                Spacer()
            }
            .task {
                await viewModel.loadProfile(userId: 1) // TODO: Replace 1 with actual logged in user ID
            }
        }
    }
    
    // Reusable settings button
    @ViewBuilder
    private func settingsButton(image: String, title: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
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
        .padding()
    }
}

#Preview {
    Profile(logoutViewModel: Login_ViewModel())
}
