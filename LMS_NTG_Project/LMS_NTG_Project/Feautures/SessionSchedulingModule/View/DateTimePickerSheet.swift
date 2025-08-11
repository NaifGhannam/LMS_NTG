//
//  DateTimePickerSheet.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 10/02/1447 AH.
//

import SwiftUI

struct DateTimePickerSheet: View {
    
    @Binding var selectedDateTime: Date?
    @Environment(\.dismiss) var dismiss
    @State private var tempDate: Date = Date()
    var pickerComponents: DatePickerComponents? = nil
    
    var body: some View {
        VStack {
            
            if pickerComponents == .date {
                
                DatePicker("Select Date", selection: $tempDate, in: Date()... , displayedComponents: .date)
                    .datePickerStyle(.graphical)
                    .labelsHidden()
                    .tint(.primaryRed)
            } else {
                
                DatePicker("Select Time", selection: $tempDate, displayedComponents: .hourAndMinute)
                    .datePickerStyle(.wheel)
                    .labelsHidden()
                    .tint(.primaryRed)
            }
        
            HStack {
                Button("Cancel") {
                    dismiss()
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 14)
                .frame(maxWidth: .infinity)
                .font(.system(size: 20, weight: .medium))
                .background(Color("BtnGray"))
                .foregroundColor(Color("BtnText"))
                .cornerRadius(8)

                Spacer().frame(width: 18)

                Button("OK") {
                    selectedDateTime = tempDate
                    dismiss()
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 14)
                .frame(maxWidth: .infinity)
                .font(.system(size: 20, weight: .medium))
                .background(Color.primaryRed)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .padding(.horizontal, 22)
        }
        .presentationDetents([.height(UIScreen.main.bounds.height * 0.5)])
    }
}
