//
//  GradeDetailsView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 17/02/1447 AH.
//

import SwiftUI

struct GradeDetailsView: View {
    
    @ObservedObject var viewModel: MyGradesViewModel
    let title: String
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        VStack {
            
            HeaderView(showFirstIcon: true, fAction: {dismiss()}, title: title)
            
            ScrollView {
                
                VStack(alignment: .leading) {
                    
                    Text("Grade Details")
                        .font(.system(size: 18, weight: .bold))
                        .padding(.vertical, 30)
                    
                    ForEach(viewModel.allSubjects) { subject in
                        
                        if title == subject.subjectName {
                            
                            ForEach(subject.grades) { grade in
                                
                                VStack {
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading, spacing: 5) {
                                            
                                            Text("\(grade.score)")
                                                .font(.system(size: 16, weight: .medium))
                                            
                                            Text("\(grade.type)")
                                                .font(.system(size: 14))
                                                .foregroundColor(Color("Red#2"))
                                        }
                                        
                                        Spacer()
                                        
                                        Text("\(grade.description)")
                                            .font(.system(size: 16))
                                    }
                                    
                                }
                                .padding(.vertical, 12)
                            }
                        }
                    }
                        
                }
                .padding(.horizontal, 20)
            }
            
            Spacer()
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}


struct GradeDetail: Identifiable {
    let id = UUID()
    var score: Int
    var type: String
    var description: String
}

struct SubjectGrades: Identifiable {
    let id = UUID()
    var subjectName: String
    var grades: [GradeDetail]
}
