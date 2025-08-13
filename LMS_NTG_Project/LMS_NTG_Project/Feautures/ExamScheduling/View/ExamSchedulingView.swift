//
//  ExamSchedulingView.swift
//  LMS_NTG_Project
//
//  Created by Naif on 02/02/1447 AH.
//
import SwiftUI

struct ExamSchedulingView: View {
    @StateObject var viewModel = ExamSchedulingViewModel()
    
    @State private var isSheetPresented = false
    @State private var isSheetPresentedTimeStart = false
    @State private var isSheetPresentedTimeEnd = false
    
    var body: some View {
        VStack(alignment : .leading , spacing: 10) {
            
            HeaderView(title: "Exam Scheduling")
            
            VStack(spacing: 15) {
                
                // Grade-Subject Picker
                VStack(alignment: .leading) {
                    Text("Grade–Subject")
                        .font(.system(size: 18))
                    Picker("Select Grade-Subject", selection: $viewModel.selectedGradeSubject) {
                        Text("Select").tag(nil as GradeSubject?)
                        ForEach(GradeSubject.all) { subject in
                            Text(subject.name).tag(subject as GradeSubject?)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.primaryRed.opacity(0.5), lineWidth: 1)
                            .shadow(color: .black.opacity(0.25), radius: 5)
                    )
                    .cornerRadius(15)
                    .pickerStyle(.menu)
                }
                
                // Exam Name
                VStack(alignment: .leading) {
                    Text("Exam Name")
                        .font(.system(size: 18))
                    TextField("Exam Name", text: $viewModel.examName)
                        .padding(14)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.primaryRed.opacity(0.5), lineWidth: 1)
                                .shadow(color: .black.opacity(0.25), radius: 5)
                        )
                        .cornerRadius(15)
                }
                
                // Exam Type Picker
                VStack(alignment: .leading) {
                    Text("Exam Type")
                        .font(.system(size: 18))
                    Picker("Select Exam Type", selection: $viewModel.selectedExamType) {
                        Text("Select").tag(nil as ExamType?)
                        ForEach(ExamType.allCases) { type in
                            Text(type.rawValue).tag(type as ExamType?)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.primaryRed.opacity(0.5), lineWidth: 1)
                            .shadow(color: .black.opacity(0.25), radius: 5)
                    )
                    .cornerRadius(15)
                    .pickerStyle(.menu)
                }
                
                // Degrees
                HStack(spacing : 20){
                    VStack{
                        Text("Max Degree")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("Max Degree", text: $viewModel.Max_Degree)
                            .keyboardType(.numberPad)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.primaryRed.opacity(0.5), lineWidth: 1)
                                    .shadow(color: .black.opacity(0.25), radius: 5)
                            )
                    }
                    
                    VStack{
                        Text("Success Degree")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("Success Degree", text: $viewModel.successDegree)
                            .keyboardType(.numberPad)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.primaryRed.opacity(0.5), lineWidth: 1)
                                    .shadow(color: .black.opacity(0.25), radius: 5)
                            )
                    }
                }
                
                // Date Picker
                VStack(alignment: .leading) {
                    Text("Date")
                        .font(.system(size: 18))
                    Button(action: { isSheetPresented = true }) {
                        HStack {
                            Image("clarity_date")
                                .resizable()
                                .frame(width: 27, height: 22)
                            Text(viewModel.selectedDate != nil ?
                                 viewModel.selectedDate!.formatted(date: .numeric, time: .omitted) :
                                 "Select Date")
                        }
                        .frame(width: 180, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.primaryRed.opacity(0.5), lineWidth: 1)
                                .shadow(color: .black.opacity(0.25), radius: 5)
                        )
                    }
                    .sheet(isPresented: $isSheetPresented) {
                        DateTimePickerSheet(selectedDateTime: $viewModel.selectedDate, pickerComponents: .date)
                    }
                }
                
                // Start & End Time
                HStack(spacing : 20){
                    VStack(alignment: .leading) {
                        Text("Start Time")
                            .font(.system(size: 18))
                        Button(action: { isSheetPresentedTimeStart = true }) {
                            HStack {
                                Image("weui_time")
                                    .resizable()
                                    .frame(width: 27, height: 22)
                                Text(viewModel.selectedTimeStart != nil ?
                                     viewModel.selectedTimeStart!.formatted(date: .omitted, time: .shortened) :
                                     "Select Time")
                            }
                            .frame(width: 180, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.primaryRed.opacity(0.5), lineWidth: 1)
                                    .shadow(color: .black.opacity(0.25), radius: 5)
                            )
                        }
                        .sheet(isPresented: $isSheetPresentedTimeStart) {
                            DateTimePickerSheet(selectedDateTime: $viewModel.selectedTimeStart, pickerComponents: .hourAndMinute)
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("End Time")
                            .font(.system(size: 18))
                        Button(action: { isSheetPresentedTimeEnd = true }) {
                            HStack {
                                Image("weui_time")
                                    .resizable()
                                    .frame(width: 27, height: 22)
                                Text(viewModel.selectedTimeEnd != nil ?
                                     viewModel.selectedTimeEnd!.formatted(date: .omitted, time: .shortened) :
                                     "Select Time")
                            }
                            .frame(width: 180, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.primaryRed.opacity(0.5), lineWidth: 1)
                                    .shadow(color: .black.opacity(0.25), radius: 5)
                            )
                        }
                        .sheet(isPresented: $isSheetPresentedTimeEnd) {
                            DateTimePickerSheet(selectedDateTime: $viewModel.selectedTimeEnd, pickerComponents: .hourAndMinute)
                        }
                    }
                }
                .padding(.bottom, 20)
            }
            .padding(.horizontal, 20)
            
            // Buttons
            HStack {
                Button {
                    Task {
                        await viewModel.submitExam()
                    }
                } label: {
                    Text("Save")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .background(viewModel.isFormValid ? Color.green : Color.gray)
                        .cornerRadius(50)
                }
                .disabled(!viewModel.isFormValid)
                
                Spacer(minLength: 20)
                Button {
                    viewModel.message = "Cancelled"
                } label: {
                    Text("Cancel")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .background(Color("PrimaryRed"))
                        .cornerRadius(50)
                }
            }
            .padding(.horizontal, 20)
            
            if let message = viewModel.message {
                Text(message)
                    .font(.system(size: 16))
                    .foregroundColor(viewModel.isSuccess ? .green : .red)
                    .padding(.top, 10)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            
            Spacer()
        }
       
    }
}

#Preview {
    ExamSchedulingView()
}
