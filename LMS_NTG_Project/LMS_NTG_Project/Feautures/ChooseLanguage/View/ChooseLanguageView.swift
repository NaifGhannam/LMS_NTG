//
//  ChooseLanguageView.swift
//  LMS_NTG_Project
//
//  Created by Naif on 12/02/1447 AH.
//

import SwiftUI

struct ChooseLanguageView: View {
    @StateObject private var viewModel = ChooseLanguageViewModel()
    var body: some View {
        HeaderView(title: "ChooseLanguage")

       VStack{
           
           Text("Select your preferred language")
               .font(.headline)
               .foregroundStyle(.secondary)
               .padding()
           HStack(spacing: 20){
               ForEach(AppLanguage.allCases){ language in
                   VStack{
                       Image(language.flagImageName)
                           .resizable()
                           .frame(width: 50, height: 50)
                       Text(language.rawValue)
                           .font(.headline)
                   }
                   .frame(maxWidth: .infinity )
                   .padding(.vertical ,20)
                   .background(viewModel.selectedLanguage == language ? Color.red.opacity(0.2) : Color.clear)
                   
                   
                   .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 3)
                   )
                   .onTapGesture {
                       viewModel.selectedLanguage = language
                   }
                   
               }
               
           }
           Spacer()
       }.padding(.horizontal , 30)
    }
}

#Preview {
    ChooseLanguageView()
}
