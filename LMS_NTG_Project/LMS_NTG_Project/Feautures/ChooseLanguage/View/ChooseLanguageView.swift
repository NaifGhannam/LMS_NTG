//
//  ChooseLanguageView.swift
//  LMS_NTG_Project
//
//  Created by Naif on 12/02/1447 AH.
//

import SwiftUI

//struct ChooseLanguageView: View {
//    @EnvironmentObject var loc: AppLocalizationManager
//
//    var body: some View {
//        HeaderView(title: "ChooseLanguage")
//
//        VStack(spacing :30){
//           
//           Text("Select your preferred language")
//               .font(.headline)
//               .foregroundStyle(.secondary)
//               .padding()
//            
//            
//           HStack(spacing: 20){
//               ForEach(AppLanguage.allCases){ language in
//                   VStack{
//                       Image(language.flagImageName)
//                           .resizable()
//                           .frame(width: 50, height: 50)
//                       Text(language.rawValue)
//                           .font(.headline)
//                   }
//                   .frame(maxWidth: .infinity )
//                   .padding(.vertical ,20)
////                   .background(viewModel.selectedLanguage == language ? Color.red.opacity(0.2) : Color.clear)
//                   
//                   .cornerRadius(10)
//                   .overlay(
//                        RoundedRectangle(cornerRadius: 10)
//                            .stroke(Color.white, lineWidth: 3 )
//                   )
//                   .onTapGesture {
////                       viewModel.selectedLanguage = language
//                   }
//                   
//               }
//               
//           }
//           
//           Button{
////               viewModel.saveLanguage()
//           }label: {
//               Text("Save")
//                   .frame(maxWidth: .infinity)
//                   .frame(height: 53)
//                   .font(.headline)
//                   .foregroundColor(.white)
//                   .background(Color("PrimaryRed"))
//                   .cornerRadius(10)
//           }
//           .padding(.top ,100)
//           Spacer()
//       }.padding(.horizontal , 30)
//    }
//}
//
//#Preview {
//    ChooseLanguageView()
//}


import SwiftUI

struct ChooseLanguageView: View {
    @EnvironmentObject var loc: AppLocalizationManager
    @Environment(\.dismiss) private var dismiss

    @State private var selected: AppLanguage

    init() {
        // Default selection = current app language
        _selected = State(initialValue: AppLocalizationManager.shared.language)
    }

    var body: some View {
        VStack(spacing: 28) {
            Text("choose_language_title")
                .font(.title3.weight(.semibold))
                .foregroundStyle(.gray)

            HStack(spacing: 24) {
                LanguageCard(
                    titleKey: "Arabic",
                    flagImage: Image("saudi_flag"), // replace with your SA flag asset e.g. Image("flag_sa")
                    isSelected: selected == .ar,
                    selectedTint: Color.red.opacity(0.12)
                )
                .onTapGesture { selected = .ar }

                LanguageCard(
                    titleKey: "English",
                    flagImage: Image("uk_flag"), // replace with your UK flag asset e.g. Image("flag_uk")
                    isSelected: selected == .en,
                    selectedTint: Color.red.opacity(0.12)
                )
                .onTapGesture { selected = .en }
            }
            .padding(.horizontal, 16)

            Button {
                // Persist & flip direction immediately
                loc.language = selected
                dismiss()
            } label: {
                Text("confirm_button")
                    .font(.headline)
                    .frame(maxWidth: .infinity, minHeight: 54)
                    .foregroundStyle(.white)
                    .background(Color("PrimaryRed"))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            .padding(.horizontal, 24)

            Spacer()
        }
        .padding(.top, 24)
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct LanguageCard: View {
    let titleKey: LocalizedStringKey
    let flagImage: Image
    let isSelected: Bool
    let selectedTint: Color

    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 22)
                .fill(isSelected ? selectedTint : .white)
                .overlay(
                    RoundedRectangle(cornerRadius: 22)
                        .stroke(.gray.opacity(0.25), lineWidth: 1)
                )
                .shadow(color: .black.opacity(0.08), radius: 6, x: 0, y: 4)

            VStack(spacing: 16) {
                flagImage
                    .resizable()
                    .scaledToFit()
                    .frame(height: 64)

                Text(titleKey)
                    .font(.title3)
                    .foregroundStyle(.primary)
            }
            .padding(24)

            // Checkmark badge
            Image(systemName: isSelected ? "checkmark.square.fill" : "square")
                .font(.title2)
                .foregroundStyle(isSelected ? .red : .gray)
                .padding(10)
        }
        .frame(width: 150, height: 190)
    }
}
