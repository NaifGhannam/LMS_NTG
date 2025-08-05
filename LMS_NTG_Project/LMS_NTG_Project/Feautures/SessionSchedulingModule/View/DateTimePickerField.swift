//
//  PickerField.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 10/02/1447 AH.
//

import SwiftUI

struct DateTimePickerField: View {
    
    var title: String
    var iconName: String
    var pickerComponents: DatePickerComponents? = nil
    var placeholderText: String
    @Binding var selectedDate: Date?
    
    @State private var isSheetPresented = false
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(title)
                .font(.system(size: 18))
            
            Button(action: { isSheetPresented = true }) {
                
                HStack {
                    
                    Text(selectedDate == nil ? placeholderText : formattedValue)
                        .foregroundColor(selectedDate == nil ? Color("TextGray") : .black)
                        .font(.system(size: 16))
                    
                    Spacer()
                    
                    Image(iconName)
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
                DateTimePickerSheet(selectedDateTime: $selectedDate, pickerComponents: pickerComponents)
            }
        }
    }
    
    private var formattedValue: String {
        guard let selectedDate = selectedDate else { return "" }
        let formatter = DateFormatter()
        formatter.dateFormat = pickerComponents == .date ? "MM/dd/yyyy" : "HH:mm"
        return formatter.string(from: selectedDate)
    }
}
