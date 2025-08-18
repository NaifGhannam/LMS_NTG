//
//  SplashView.swift
//  LMS_NTG_Project
//
//  Created by Naif on 19/02/1447 AH.
//



import SwiftUI

struct SplashView: View {
    // MARK: - Variables
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.6
    @EnvironmentObject var languageManager: LanguageManager

    var body: some View {
        
        if isActive == true {
            if UserDefaults.standard.bool(forKey: "isLoggedIn") {
                              MainTabView()
                    .environmentObject(languageManager)
                          } else {
                              LoginView()
                                  .environmentObject(languageManager)
                          }
        } else {
            VStack{
                VStack{
                    Spacer()
                        .frame(height: UIScreen.main.bounds.height * 0.1)
                    Image("NTG_LMS_LOGO")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.3)
                        .foregroundColor(.blue)
                    Spacer()
                }.scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
            }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.isActive = true
                }
            }
        }
   
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
