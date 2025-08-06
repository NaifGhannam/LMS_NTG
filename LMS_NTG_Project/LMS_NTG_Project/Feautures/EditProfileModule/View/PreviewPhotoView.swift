//
//  ImagePickerView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 12/02/1447 AH.
//

import SwiftUI
import PhotosUI

struct PreviewPhotoView: View {
    
    @Binding var avatarImage: UIImage?
    @State private var photoPickerItem: PhotosPickerItem? = nil
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        VStack {
            
            HeaderView(showFirstIcon: true, fAction: {
                avatarImage = nil
                dismiss()
            }, title: "Preview Photo")
            
            VStack {
              
                Image(uiImage: avatarImage ?? UIImage(resource: .defaultAvatar))
                    .resizable()
                    .cornerRadius(46)
                    .frame(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height * 0.6)
                    .padding(.top, 10)
                
                
                Spacer()
                
                VStack {
                  
                    PhotosPicker(selection: $photoPickerItem, matching: .images) {
                        Text("Select another photo")
                            .foregroundColor(.primaryRed)
                            .font(.system(size: 18, weight: .semibold))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.btnGray.opacity(0.5))
                            .cornerRadius(10)
                            .padding(.bottom, 12)
                    }
                    
                    CustomButton(title: "Confirm") {
                        dismiss()
                    }
                }
                .padding(.horizontal, 10)
                    
                
            }
            .padding(.horizontal, 20)
            .task(id: photoPickerItem) {
                
                if let photoPickerItem, let data = try? await photoPickerItem.loadTransferable(type: Data.self) {
                    
                    if let image = UIImage(data: data) {
                        avatarImage = image
                    }
                }
                
                photoPickerItem = nil
            }
            
            Spacer()
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

//#Preview {
//    PreviewPhotoView()
//}
