//
//  HeaderView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 03/02/1447 AH.
//

import SwiftUI

struct HeaderView: View {
    
    @State var showFirstIcon: Bool = false
    @State var firstIcon: String = "white_right_chevron"
    @State var fAction: (() -> ())?
    
    @State var showSecondIcon: Bool = false
    @State var secondIcon: String = "white_upload"
    @State var sAction: (() -> ())?
    
    var title: String = "Title"
    
    var body: some View {
        VStack {
            HStack {
                
                if showFirstIcon {
                    
                    Button(action: {fAction?()}) {
                        Image(firstIcon)
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    
                } else {
                    
                    Spacer()
                        .frame(width: 30, height: 30)
                }
                
                Spacer()
                
                Text(title)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(Color.white)
                
                Spacer()
                
                if showSecondIcon {
                    
                    Button(action: {sAction?()}) {
                        Image(secondIcon)
                            .resizable()
                            .frame(width: 29, height: 29)
                    }
                    
                } else {
                    
                    Spacer()
                        .frame(width: 30, height: 30)
                }
            }
            .padding([.horizontal, .bottom], 20)
        }
        .frame(maxWidth: .infinity)
        .background(Color.primaryRed)
    }
}

#Preview {
    HeaderView()
}
