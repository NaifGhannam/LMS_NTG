//
//  ExamSchedulingView.swift
//  LMS_NTG_Project
//
//  Created by Naif on 02/02/1447 AH.
//

import SwiftUI

struct ExamSchedulingView: View {
   @StateObject var viewModel = ExamSchedulingViewModel()
    var body: some View {
        
        VStack(alignment : .leading , spacing: 10){
            
        HeaderView(title: "Exam Scheduling")
            
            VStack{
            //Grade-Subject
            Section(header: Text("Grade–Subject")) {
                Picker("Grade Subject", selection: $viewModel.selectedGradeSubject) {
                    ForEach(viewModel.GradeSubject, id: \.self) {
                        Text($0)
                    }
                }
                .background(Color.white)
                .cornerRadius(10)
                
            }
            
            
            
            
            
            Section(header: Text("Duration")){
                HStack{
                    TextField("e.g., 90", text: $viewModel.duration)
                    
                    Image(systemName: "applewatch")
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
            }
            
            Section(header: Text("Weightage")){
                
                TextField("e.g., 30", text: $viewModel.Weightage)
                    .padding()
                    .background(Color.white)
                .cornerRadius(10)            }
            
            Section(header : Text("Room / Location")){
                TextField("e.g. Room 204" ,text :$viewModel.room )
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
            }
            
            
            // DATE AND TIME
            Section(header : Text("Date & Time")){
                HStack{
                    
                    DatePicker("Please enter a date", selection: $viewModel.date, displayedComponents: .date).labelsHidden()
                    Spacer()
                    DatePicker("Please enter a time", selection: $viewModel.time, displayedComponents: .hourAndMinute).labelsHidden()
                }.padding(.horizontal , 30)
            }
            
            Section(header : Text("Exam Type (Midterm/Final)")){
                Picker("Exam Type",selection: $viewModel.selectedExamType){
                    ForEach(viewModel.examType, id: \.self){
                        Text($0)
                        
                    }
                    
                }
                .background(Color.white)
                .cornerRadius(10)
                
            }.padding(.bottom , 30)
            
            HStack(){
                Button(){
                    Task{
                        await viewModel.addExam()
                    }
                }label: {
                    Text("Save")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(50)
                    
                }
                
                Spacer(minLength: 20)
                Button(){
                    print("Cancel")
                }label: {
                    Text("Cancel")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame( height: 60)
                        .frame(maxWidth: .infinity)
                        .background(Color("PrimaryRed"))
                        .cornerRadius(50)
                }
                
            }
            .frame(maxWidth: .infinity)
            
            
            Spacer()
        }
            .padding(.horizontal ,20)
        }
        
        .background(Color("PrimaryLightGray"))
            
    }
}


#Preview {
    ExamSchedulingView()
}
