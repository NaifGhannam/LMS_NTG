//
//  ForgotPasswordHeader.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 20/01/1447 AH.
//

import SwiftUI

struct ForgotPasswordHeader: View {
    
    var action: (() -> ())?
    
    var body: some View {
        
        VStack {
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("PrimaryRed"))
                .frame(height: UIScreen.main.bounds.size.height * 0.26)
                .ignoresSafeArea(edges: .top)
                .overlay {
                    
                    VStack(alignment: .leading) {
                    
                        Button(action: {action?()}) {
                            Image("white_right_chevron")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                        .padding(.bottom, 10)                        
                        Text("FORGOT \nPASSWORD")
                            .font(.largeTitle)
                            .bold()
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 30)
                }
        }
    }
}

#Preview {
    ForgotPasswordHeader()
}
