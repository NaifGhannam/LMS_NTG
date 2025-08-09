//
//  LoginView.swift
//  LMS_NTG_Project
//
//  Created by Naif on 20/01/1447 AH.
//

import SwiftUI
@MainActor
class Login_ViewModel : ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var isLoggedIn = false
    @Published var isLoggedOut = false
    @Published var loginResponse: LoginResponse?
    @Published var errorMessage: String?
    
    
    

    private let loginService: LoginServiceProtocol

    init(loginService: LoginServiceProtocol = LoginService()) {
        self.loginService = loginService
    }

    func login() async {
        isLoading = true
        errorMessage = nil
        guard validateInputs() else {
              return
          }
        guard validateInputs() else {
            isLoading = false  
            return
        }

        do {
            let result = try await loginService.login(email: email, password: password)
            self.loginResponse = result
            
            UserDefaults.standard.set(true, forKey: "isLoggedIn")
            UserDefaults.standard.set(result.userId, forKey: "userId")
            UserDefaults.standard.set(result.role.roleId, forKey: "roleId")
            UserDefaults.standard.set(result.role.roleName, forKey: "roleName")
            UserDefaults.standard.set(result.email, forKey: "userEmail")

            self.isLoggedIn = true
        } catch {
            self.errorMessage = error.localizedDescription
        }

        isLoading = false
    }
    
    
    
    func validateInputs() -> Bool {
        if email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            errorMessage = "Email is required."
            return false
        }
        
        if !isValidEmail(email) {
            errorMessage = "Invalid email format."
            return false
        }

        if password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            errorMessage = "Password is required."
            return false
        }

        return true
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }

    
    func logout() {
        UserDefaults.standard.removeObject(forKey: "isLoggedIn")
        UserDefaults.standard.removeObject(forKey: "userId")
        UserDefaults.standard.removeObject(forKey: "roleId")
        UserDefaults.standard.removeObject(forKey: "roleName")
        UserDefaults.standard.removeObject(forKey: "userEmail")
       
        isLoggedIn = false
        isLoggedOut = true

    }
    
}











