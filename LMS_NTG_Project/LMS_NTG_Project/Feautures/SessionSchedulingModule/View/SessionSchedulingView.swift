//
//  SessionSchedulingView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 10/02/1447 AH.
//

import SwiftUI

struct SessionSchedulingView: View {
    
    @State private var selectedDate: Date? = nil
    @State private var selectedTime: Date? = nil
    @State private var isSheetPresented = false
    @State private var selectedFlavor: Flavor? = nil
    @State private var selectedType: SessionType? = nil
    
    var body: some View {
        
        VStack {
            
            HeaderView(title: "Session Scheduling")
            
            VStack(spacing: 15) {
                
                PickerMenu(
                    title: "Grade–Subject",
                    placeholder: "Select Grade–Subject",
                    iconName: "ion_chevron",
                    selection: $selectedFlavor
                )
                
                DateTimePickerField(
                    title: "Date",
                    iconName: "clarity_date",
                    pickerComponents: .date,
                    placeholderText: "MM/DD/YYYY",
                    selectedDate: $selectedDate
                )
                
                DateTimePickerField(
                    title: "Time",
                    iconName: "weui_time",
                    pickerComponents: .hourAndMinute,
                    placeholderText: "00:00:00",
                    selectedDate: $selectedTime
                )
                
                PickerMenu(
                    title: "Type (Lecture/Lab)",
                    placeholder: "Session Type",
                    iconName: nil,
                    selection: $selectedType
                )
                
                HStack {
                    Button(action: {}) {
                        Text("Save")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.primaryGreen)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.6), radius: 4)
                    
                    Spacer()
                        .frame(width: 50)
                    
                    Button(action: {
                        selectedFlavor = nil
                        selectedDate = nil
                        selectedTime = nil
                        selectedType = nil
                    }) {
                        Text("Cancel")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.primaryRed)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.6), radius: 4)
                }
                .padding()
            }
            .padding(.horizontal, 20)
            .padding(.top)
            
            Spacer()
        }
    }
}

#Preview {
    SessionSchedulingView()
}


enum Flavor: String, CaseIterable, Identifiable {
    case chocolate, vanilla, strawberry
    var id: Self { self }
}

enum SessionType: String, CaseIterable, Identifiable {
    case Lecture, Lab
    var id: Self { self }
}


