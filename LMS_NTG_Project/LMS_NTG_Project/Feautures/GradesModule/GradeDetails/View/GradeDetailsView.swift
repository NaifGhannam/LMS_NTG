//
//  GradeDetailsView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 17/02/1447 AH.
//

import SwiftUI

struct GradeDetailsView: View {
    
    @StateObject private var viewModel = GradeDetailsViewModel()
    let title: String
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        VStack {
            
            HeaderView(showFirstIcon: true, fAction: {dismiss()}, title: title)
            
            ScrollView {
                
                VStack(alignment: .leading) {
                    
                    Text("Grade Details")
                        .font(.system(size: 18, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 30)
                    
                    ForEach(viewModel.result ?? []) { item in
                        
                        if title == item.subjectName {
                            VStack {
                                
                                HStack {
                                    
                                    Text("\(item.degree)")
                                        .font(.system(size: 16, weight: .medium))
                                    
                                    Spacer()
                                    
                                    Text("\(item.type)")
                                        .font(.system(size: 16))
                                }
                                
                            }
                            .padding(.vertical, 12)
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
            Spacer()
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .task {
            await viewModel.getGradeDetails()
        }
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

