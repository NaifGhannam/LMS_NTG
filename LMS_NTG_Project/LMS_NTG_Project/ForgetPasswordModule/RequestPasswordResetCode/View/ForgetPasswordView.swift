//
//  ForgetPasswordView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 03/02/1447 AH.
//

import SwiftUI

struct ForgetPasswordView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HeaderView(showFirstIcon: true, title: "Forgot Password")
                    
                Spacer()
            }
        }
    }
}

#Preview {
    ForgetPasswordView()
}
