//
//  ExamSchedulingView.swift
//  LMS_NTG_Project
//
//  Created by Naif on 02/02/1447 AH.
//

import SwiftUI

struct ExamSchedulingView: View {
    @StateObject var viewModel = ExamSchedulingViewModel()
    
    

    
    @State private var selectedGradeSubject: GradeSubject? = nil
    @State private var selectedExamType: ExamType? = nil
    @State private var isSheetPresented = false
    @State private var isSheetPresentedTimeStart = false
    @State private var isSheetPresentedTimeEnd = false
    
    var body: some View {
        
        
        VStack(alignment : .leading , spacing: 10) {
            
            HeaderView(title: "Exam Scheduling")
            
            VStack(spacing: 15) {
                
                PickerMenu(
                    title: "Grade–Subject",
                    placeholder: "Select Grade–Subject",
                    iconName: "ion_chevron",
                    selection: $selectedGradeSubject
                )
                
                VStack(alignment: .leading) {
                    
                    Text("Exam Name")
                        .font(.system(size: 18))
                    
                    HStack{
                        TextField("Exam Name", text: $viewModel.examName)
                        
                        
                    } .padding(14)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.primaryRed.opacity(0.5), lineWidth: 1)
                                .shadow(color: .black.opacity(0.25), radius: 5)
                        )
                        .cornerRadius(15)
                }
                
                PickerMenu(
                    title: "Exam Type",
                    placeholder: "Exam Type",
                    iconName: "ion_chevron",
                    selection: $selectedExamType
                )
                
                HStack(spacing : 20){
                    
                    VStack{
                        
                        Text("Max_Degree")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("Max_Degree", text: $viewModel.Max_Degree)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.primaryRed.opacity(0.5), lineWidth: 1)
                                    .shadow(color: .black.opacity(0.25), radius: 5)
                            )
                            .cornerRadius(15)
                    }
                    
                    VStack{
                        Text("Success_Degree")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("Success_Degree", text: $viewModel.successDegree)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.primaryRed.opacity(0.5), lineWidth: 1)
                                    .shadow(color: .black.opacity(0.25), radius: 5)
                            )
                            .cornerRadius(15)
                    }
                }//HStack End
                
                //Date
                    VStack(alignment: .leading) {
                        
                        Text("Date")
                            .font(.system(size: 18))
                        
                        Button(action: { isSheetPresented = true }) {
                            
                            HStack {
                                Image("clarity_date")
                                    .resizable()
                                    .frame(width: 27, height: 22)
                            }
                            .frame(width:150 , height : 50)                              .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.primaryRed.opacity(0.5), lineWidth: 1)
                                    .shadow(color: .black.opacity(0.25), radius: 5)
                            )
                            .cornerRadius(15)
                        }
                        .sheet(isPresented: $isSheetPresented) {
                            DateTimePickerSheet(selectedDateTime: $viewModel.selectedDate, pickerComponents: .date)
                        }
                    }
                
                HStack(spacing : 20){
                    //StartTime
                    VStack(alignment: .leading) {
                        
                        Text("start Time")
                            .font(.system(size: 18))
                        
                        Button(action: { isSheetPresentedTimeStart = true }) {
                            
                            HStack {
                                Image("weui_time")
                                    .resizable()
                                    .frame(width: 27, height: 22)
                            }
                            .frame(width:150 , height : 50)                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.primaryRed.opacity(0.5), lineWidth: 1)
                                    .shadow(color: .black.opacity(0.25), radius: 5)
                            )
                            .cornerRadius(15)
                        }
                        .sheet(isPresented: $isSheetPresentedTimeStart) {
                            DateTimePickerSheet(selectedDateTime: $viewModel.selectedTimeStart, pickerComponents: .hourAndMinute)
                        }
                    }//StartTime / end
                    
                    
                    
                    VStack(alignment: .leading) {
                        
                        Text("end Time")
                            .font(.system(size: 18))
                        
                        Button(action: { isSheetPresentedTimeEnd = true }) {
                            
                            HStack {
                                Image("weui_time")
                                    .resizable()
                                    .frame(width: 27, height: 22)
                            }
                            .frame(width:150 , height : 50)                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.primaryRed.opacity(0.5), lineWidth: 1)
                                    .shadow(color: .black.opacity(0.25), radius: 5)
                            )
                            .cornerRadius(15)
                        }
                        .sheet(isPresented: $isSheetPresentedTimeEnd) {
                            DateTimePickerSheet(selectedDateTime: $viewModel.selectedTimeEnd, pickerComponents: .hourAndMinute)
                        }
                    }
                }.padding(.bottom, 20)
                
            }
            .padding(.horizontal, 20)
            
            //buttons
            HStack(){
                Button(){
                    Task{
                        print("added")
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
            .padding(.horizontal, 20)
            
        }
            
            
           
           
            
            
            Spacer()
        
        // just test
//        Text(formatDate(viewModel.selectedDate))
//        Text("start \(formatTime(viewModel.selectedTimeStart))")
//        Text(formatTime(viewModel.selectedTimeEnd))
//     
    }
    
    
}



#Preview {
    ExamSchedulingView()
}

func formatTime(_ date: Date?) -> String {
    guard let date = date else { return "N/A" }
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    return formatter.string(from: date)
}
func formatDate(_ date: Date?) -> String {
    guard let date = date else {
        return "N/A"
    }
    
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter.string(from: date)
}
