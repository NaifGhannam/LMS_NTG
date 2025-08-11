//
//  LoginView.swift
//  LMS_NTG_Project
//
//  Created by Naif on 20/01/1447 AH.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = Login_ViewModel()
    
    var body: some View {
        ZStack {
            Color("PrimaryRed").edgesIgnoringSafeArea(.all)
            VStack {
                Rectangle()
                    .fill(Color("PrimaryLightGray"))
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: UIScreen.main.bounds.height * 0.65
                    )
                    .cornerRadius(20)
                    .ignoresSafeArea(.all)
                Spacer()
            }

            VStack {
                Image("NTG_LMS_LOGO")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.3)
                
                loginBox(viewModel: viewModel)
                
                Spacer()
            }
        }
    }
}





#Preview {
    LoginView()
}
