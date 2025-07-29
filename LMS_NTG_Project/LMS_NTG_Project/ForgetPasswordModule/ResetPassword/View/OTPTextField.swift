//
//  OTPTextField.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 04/02/1447 AH.
//

import SwiftUI

struct OTPTextField: View {
    
    let numberOfFields: Int
    
    @State var enteredOTP: [String]
    @FocusState private var fieldFocus: Int?
    
    init(numberOfFields: Int) {
        self.numberOfFields = numberOfFields
        self.enteredOTP = Array(repeating: "", count: numberOfFields)
    }
    
    var body: some View {
        HStack {
            
            ForEach(0..<numberOfFields, id: \.self) { index in
                
                TextField("", text: $enteredOTP[index])
                    .frame(width: 40, height: 40)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.primaryRed.opacity(0.25), lineWidth: 1)
                    }
                    .multilineTextAlignment(.center)
                    .focused($fieldFocus, equals: index)
                    .tag(index)
                    .onChange(of: enteredOTP[index]) { newValue, _ in
                        fieldFocus = (fieldFocus ?? 0) + 1
                    }
            }
            .padding(.horizontal, 3)
        }
    }
}

#Preview {
    OTPTextField(numberOfFields: 4)
}
