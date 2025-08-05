//
//  LabeledDatePicker.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 02/02/1447 AH.
//

import SwiftUI

struct LabeledDatePicker: View {
    
    let title: String
    let placeholder: String
    @Binding var date: Date
    let components: DatePickerComponents
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 20))
            
            HStack {
                Text(placeholder)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.gray.opacity(0.5))
                
                Spacer()
                
                DatePicker("", selection: $date, displayedComponents: components)
                    .labelsHidden()
            }
            .inputStyle()
        }
    }
}
