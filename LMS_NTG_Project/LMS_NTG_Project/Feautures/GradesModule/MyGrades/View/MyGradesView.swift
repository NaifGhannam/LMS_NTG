//
//  MyGradesView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 06/02/1447 AH.
//

import SwiftUI

struct MyGradesView: View {
    
    @State private var isSubject: Bool = false
    @State private var isGrade: Bool = false
    
    @StateObject private var viewModel = MyGradesViewModel()
    
    var body: some View {
        VStack {
            
            HeaderView(showSecondIcon: true, secondIcon: "download", title: "My Grades")
            
            VStack {
                
                Spacer()
                    .frame(height: UIScreen.main.bounds.size.height * 0.05)
                
                HStack {
                    
                    PickerButton(title: "Subject") {
                        isSubject.toggle()
                    }
                    .sheet(isPresented: $isSubject) {
                        SubjectSheet(subjectGrades: viewModel.subjectGrades, viewModel: viewModel)
                            .padding(.horizontal, 20)
                    }
                    
                    Spacer()
                    
                    PickerButton(title: "Grade") {
                        isGrade.toggle()
                    }
                    .sheet(isPresented: $isGrade) {
                        SubjectSheet(subjectGrades: viewModel.subjectGrades, viewModel: viewModel, isGradeSelected: true)
                            .padding(.horizontal, 20)
                    }
                }
                
                ForEach(viewModel.displayFilteredSubjects(), id: \.id) { subject in
                    
                    NavigationLink(destination: GradeDetailsView(title: subject.name)) {
                        
                        HStack(spacing: 22) {
                            
                            Image(subject.icon)

                            Text(subject.name)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Text(subject.grade)
                                .font(.title2)
                                .bold()
                                .foregroundColor(.red)
                                .shadow(color: .black.opacity(0.3), radius: 5, y: 3)
                        }
                        .padding(20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.white)
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.black.opacity(0.05), lineWidth: 1)
                                .shadow(color: .black, radius: 1)
                        }
                    }
                }
                .padding(.vertical, 10)
                
            }
            .padding(.horizontal, 20)
            
            Spacer()
        }
    }
}

#Preview {
    MyGradesView()
}

