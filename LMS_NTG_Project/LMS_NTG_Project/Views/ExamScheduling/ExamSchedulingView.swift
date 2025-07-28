//
//  ExamSchedulingView.swift
//  LMS_NTG_Project
//
//  Created by Naif on 02/02/1447 AH.
//

import SwiftUI

struct ExamSchedulingView: View {
    var GradeSubject = ["Grade 10 - Math", "Grade 11 - Biology", "Grade 12 - Physics"]
       @State private var selectedGradeSubject = "Grade 10 - Math"
    @State private var duration = ""
    @State private var Weightage = ""
    @State private var room = ""
    @State private var date = Date()
    @State private var time = Date()
    @State private var examType = ["midterm", "final"]
    @State private var selectedExamType = "midterm"
    var body: some View {
        
 
                       
        VStack(alignment : .leading , spacing: 10){
            
            ZStack {
                      Color("PrimaryRed")
                          .clipShape(RoundedCornerShape(corners: [.bottomRight], radius: 50))

                      Text("Exam Scheduling")
                          .font(.system(size: 26, weight: .bold))
                          .foregroundColor(.white)
                       
                  }
                  .ignoresSafeArea()
                  .padding(.trailing,10)
           

            //Grade-Subject
            Section(header: Text("Grade–Subject")) {
                Picker("Grade Subject", selection: $selectedGradeSubject) {
                    ForEach(GradeSubject, id: \.self) {
                        Text($0)
                    }
                }
                .background(Color.white)
                .cornerRadius(10)
                
            }
            
            
            
            
            
            Section(header: Text("Duration")){
                HStack{
                    TextField("e.g., 90", text: $duration)

                    Image(systemName: "applewatch")
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
            }
            
            Section(header: Text("Weightage")){
            
                    TextField("e.g., 30", text: $Weightage)
                .padding()
                .background(Color.white)
                .cornerRadius(10)            }

            Section(header : Text("Room / Location")){
                TextField("e.g. Room 204" ,text :$room )
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
            }

            
             // DATE AND TIME
            Section(header : Text("Date & Time")){
                HStack{
                    
                    DatePicker("Please enter a date", selection: $date, displayedComponents: .date).labelsHidden()
                    Spacer()
                    DatePicker("Please enter a time", selection: $time, displayedComponents: .hourAndMinute).labelsHidden()
                }.padding(.horizontal , 30)
            }
           
            Section(header : Text("Exam Type (Midterm/Final)")){
                Picker("Exam Type",selection: $selectedExamType){
                    ForEach(examType, id: \.self){
                        Text($0)
                        
                    }
                   
                }
                    .background(Color.white)
                    .cornerRadius(10)

            }.padding(.bottom , 30)
            
        HStack(){
                Button(){
                    print("Save")
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
        .padding(.horizontal)
        .background(Color("PrimaryLightGray"))
            
    }
}


struct RoundedCornerShape: Shape {
    var corners: UIRectCorner
    var radius: CGFloat

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
#Preview {
    ExamSchedulingView()
}
