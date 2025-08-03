//
//  SubjectSheet.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 06/02/1447 AH.
//

import SwiftUI

struct SubjectSheet: View {
    
    @Environment(\.dismiss) private var dismiss

    @State var subjectGrades: [SubjectGrade]
    @ObservedObject var viewModel: MyGradesViewModel
    
    var body: some View {
        VStack {
            
            HStack {
                Button(action: {
                    viewModel.selectedSubject = nil
                    dismiss()
                }) {
                    Text("Cancel")
                        .font(.system(size: 16))
                        .foregroundStyle(Color.primaryRed)
                }
                
                Spacer()
            }
            .padding(.bottom)
            
            Text("Subject")
                .font(.system(size: 18))
            
            Picker("Subject", selection: $viewModel.selectedSubject) {
                
                ForEach(subjectGrades) { subject in
                   
                    Text(subject.name).tag(Optional(subject))
                }
            }
            .pickerStyle(.wheel)
            .presentationDetents([.height(UIScreen.main.bounds.height * 0.4)])
        }
    }
}

struct SubjectGrade: Identifiable, Equatable, Hashable {
    
    let id = UUID()
    let name: String
    let icon: String
    let grade: String
}
