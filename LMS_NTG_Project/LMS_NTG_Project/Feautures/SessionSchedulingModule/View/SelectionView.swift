//
//  SelectionView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 16/02/1447 AH.
//

import SwiftUI

struct SelectionView<T: Identifiable & RawRepresentable & Hashable>: View where T.RawValue == String {
    
    @Binding var selectedType: T?
    @State private var isSheetPresented: Bool = false
    
    var title: String
    var options: [T]
    var label: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 18))
            
            Button(action: { isSheetPresented = true }) {
                HStack {
                    Text(selectedType?.rawValue.capitalized ?? label)
                        .foregroundColor(selectedType == nil ? Color("TextGray") : .black)
                        .font(.system(size: 16))
                    
                    Spacer()
                    
                    Image("ion_chevron")
                        .resizable()
                        .frame(width: 22, height: 22)
                }
                .padding(14)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.primaryRed.opacity(0.5), lineWidth: 1)
                        .shadow(color: .black.opacity(0.25), radius: 5)
                )
                .cornerRadius(15)
            }
            .sheet(isPresented: $isSheetPresented) {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Select \(title)")
                        .font(.system(size: 18))
                    
                    Picker(title, selection: $selectedType) {
                        ForEach(options) { option in
                            Text(option.rawValue.capitalized)
                                .tag(option as T?)
                        }
                    }
                    .padding(.vertical)
                    
                    Button(action: { selectedType = nil }) {
                        Text("Cancel")
                            .font(.system(size: 16))
                            .foregroundColor(.primaryRed)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .pickerStyle(.segmented)
                .presentationDetents([.height(UIScreen.main.bounds.height * 0.25)])
                .padding(.horizontal, 20)
            }
        }
    }
}
