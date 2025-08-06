//
//  EditProfileHeader.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 12/02/1447 AH.
//

import SwiftUI

struct EditProfileHeader: View {
    
    @State private var avatarImage: UIImage?
    
    var body: some View {
        
        HStack(spacing: 12) {
            
            Image(uiImage: avatarImage ?? UIImage(resource: .defaultAvatar))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 76, height: 76)
                .clipShape(Circle())
            
            NavigationLink(destination: ImagePickerView()){
                Text("Edit Photo")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.black)
            }
            .frame(width: 112)
            .padding(.vertical, 10)
            .background(.lightGray.opacity(0.5))
            .cornerRadius(22)
            
            Button(action: {}) {
                
                Text("Remove")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.darkerRed)
            }
            .frame(width: 112)
            .padding(.vertical, 10)
            .background(.fadedRed.opacity(0.4))
            .cornerRadius(22)
            
            Spacer()
            
        }
        .padding(.vertical, UIScreen.main.bounds.height * 0.04)
    }
}

#Preview {
    EditProfileHeader()
}
