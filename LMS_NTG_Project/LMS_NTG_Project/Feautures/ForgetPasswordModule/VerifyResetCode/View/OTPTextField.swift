//
//  OTPTextField.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 04/02/1447 AH.
//

import SwiftUI

struct OTPTextField: View {
    
    let numberOfFields: Int
    
    @State var otpDigits: [String]
    @Binding var enteredOTP: String
    
    @FocusState private var fieldFocus: Int?
    
    init(numberOfFields: Int, enteredOTP: Binding<String>) {
        self.numberOfFields = numberOfFields
        self._enteredOTP = enteredOTP
        self.otpDigits = Array(repeating: "", count: numberOfFields)
    }
    
    var body: some View {
        HStack {
            
            ForEach(0..<numberOfFields, id: \.self) { index in
                
                TextField("", text: $otpDigits[index])
                    .frame(width: 40, height: 40)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.primaryRed.opacity(0.25), lineWidth: 1)
                    }
                    .multilineTextAlignment(.center)
                    .focused($fieldFocus, equals: index)
                    .tag(index)
                    .onChange(of: otpDigits[index]) { newValue, _ in
                        fieldFocus = (fieldFocus ?? 0) + 1
                        updateEnteredOTP()
                    }
            }
            .padding(.horizontal, 3)
        }
    }
    
    private func updateEnteredOTP() {
        enteredOTP = otpDigits.joined()
    }
}

