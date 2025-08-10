//
//  SessionSchedulingView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 10/02/1447 AH.
//

import SwiftUI

struct SessionSchedulingView: View {
    
    @State private var isSheetPresented = false
    @StateObject private var viewModel = SessionViewModel()
    @State private var showAlert = false
    
    var body: some View {
        
        VStack {
            
            HeaderView(title: "Session Scheduling")
            
            VStack(spacing: 15) {
                
                
                PickerMenu(
                    title: "Grade–Subject",
                    placeholder: "Select Grade–Subject",
                    iconName: "ion_chevron",
                    options: viewModel.sessions,
                    getLabel: { "\($0.grade.gradeName) - \($0.subject.subjectName)" },
                    selection: $viewModel.selectedSession
                )
                
                PickerMenu(
                    title: "Class",
                    placeholder: "Select class",
                    iconName: "ion_chevron",
                    options: viewModel.classes,
                    getLabel: { "\($0.className)" },
                    selection: $viewModel.selectedClass
                )
                
                DateTimePickerField(
                    title: "Session Date",
                    iconName: "clarity_date",
                    pickerComponents: .date,
                    placeholderText: "MM/DD/YYYY",
                    selectedDate: $viewModel.selectedDate
                )
                
                VStack(alignment: .leading) {
                    
                    Text("Session Number")
                        .font(.system(size: 18))
                    
                    TextField("Enter session number", text: $viewModel.enteredNumber)
                        .font(.system(size: 16))
                    
                        .padding(14)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.primaryRed.opacity(0.5), lineWidth: 1)
                                .shadow(color: .black.opacity(0.25), radius: 5)
                        )
                        .cornerRadius(15)
                }
                
                SelectionView(
                    selectedType: $viewModel.selectedType,
                    title: "Type",
                    options: SessionType.allCases,
                    label: "Select type"
                )
                
                SelectionView(
                    selectedType: $viewModel.selectedStatus,
                    title: "Status",
                    options: Status.allCases,
                    label: "Select status"
                )
                
                HStack {
                    Button(action: {
                        Task {
                            await viewModel.sessionScheduling()
                            showAlert = true
                        }
                    }) {
                        Text("Save")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(viewModel.isButtonDisabled ? .gray : Color.primaryGreen)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.6), radius: 4)
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text(viewModel.status ?? ""),
                            message: Text(viewModel.message ?? "")
                        )
                    }
                    .disabled(viewModel.isButtonDisabled)
                    
                    Spacer()
                        .frame(width: 50)
                    
                    Button(action: {
                        
                        viewModel.clear()
                        
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
        .task {
            await viewModel.fetchData()
        }
        
    }
}

#Preview {
    SessionSchedulingView()
}



