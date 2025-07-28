//
//  RolesPermissionsHeader.swift
//  LMS_NTG_Project
//
//  Created by Naif on 28/01/1447 AH.
//

import SwiftUI

struct RolesPermissionsHeader: View {
    var body: some View {
        VStack{
            
            Text("Roles & Permissions")
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(.white)
        }
        .frame(height: UIScreen.main.bounds.height * 0.07)
        .frame(maxWidth: .infinity , minHeight: 10)
        .background(Color("PrimaryRed"))
    }
}

#Preview {
    RolesPermissionsHeader()
}
