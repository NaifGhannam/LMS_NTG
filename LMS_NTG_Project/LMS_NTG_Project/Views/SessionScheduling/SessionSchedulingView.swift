//
//  SessionSchedulingView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 02/02/1447 AH.
//

import SwiftUI

struct SessionSchedulingView: View {
    
    @State private var selectedSubject: Options = .option
    @State private var selectedType: Options = .option
    @State private var date = Date()
    @State private var time = Date()
    @State var sendNotification: Bool = false
    
    var body: some View {
        ZStack {
            Color.pink
                .opacity(0.05)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    
                    VStack {
                        
                        Spacer()
                            .frame(height: 30)
                        
                        Text("Session Scheduling")
                            .padding(.vertical, 30)
                    }
                    .frame(maxWidth: .infinity)
                    .background(.primaryRed)
                    .foregroundColor(.white)
                    .font(.system(size: 23, weight: .semibold))
                    .cornerRadius(20)
                    
                    VStack(spacing: 18) {
                        
                        LabeledPickerView(
                            title: "Grade-Subject",
                            placeholder: "Select Grade-Subject",
                            selection: $selectedSubject,
                            options: Options.allCases
                        )
                        .padding(.top, 14)
                        
                        LabeledTextField(
                            title: "Recurrence Options",
                            placeholder: "Recurrence Options",
                            text: .constant("")
                        )
                        
                        LabeledTextField(
                            title: "Location",
                            placeholder: "Choose U Location",
                            text: .constant("")
                        )
                        
                        LabeledDatePicker(
                            title: "Date",
                            placeholder: "MM/DD/YYYY",
                            date: $date,
                            components: [.date]
                        )
                        
                        LabeledDatePicker(
                            title: "Time",
                            placeholder: "",
                            date: $time,
                            components: [.hourAndMinute]
                        )
                        
                        
                        LabeledPickerView(
                            title: "Type (Lecture/Lab)",
                            placeholder: "Session Type",
                            selection: $selectedType,
                            options: Options.allCases
                        )
                        
                        Button(action: {sendNotification.toggle()}) {
                            
                            HStack {
                                Image(systemName: sendNotification ? "checkmark.square" : "square")
                                    .resizable()
                                    .frame(width: 22, height: 20)
                                    .padding()
                                
                                Text("Send Notifications")
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 20))
                            }
                        }
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            
                            ActionButton(title: "Save", backgroundColor: Color.primaryGreen)
                            
                            Spacer()
                            
                            ActionButton(title: "Cancel", backgroundColor: Color.primaryRed)
                        }
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 25)
                    
                    
                    Spacer()
                }
            }
            .ignoresSafeArea(edges: .top)
        }
    }
}

#Preview {
    SessionSchedulingView()
}

enum Options: String, CaseIterable, Identifiable {
    case option, option2, option3
    var id: Self { self }
}



