//
//  TakeAttendanceView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 11/02/1447 AH.
//

import SwiftUI

struct TakeAttendanceView: View {
    
    @State var isSelectAll: Bool = false
    
    var body: some View {
        VStack {
            HeaderView(title: "Take Attendance")
            
            VStack {
                Menu {
                    
                } label: {
                    HStack {
                        Text("Class")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Image("ion_chevron_back")
                    }
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.primaryRed.opacity(0.5), lineWidth: 1)
                    }
                }
                
                Button(action: {isSelectAll.toggle()}) {
                    HStack(spacing: 15) {
                        Image(isSelectAll ? "group" : "group")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
                        
                        Text("Select All")
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                    }
                }
                
                
                VStack(spacing: 0) {
                    
                    Text("Name")
                        .font(.system(size: 18, weight: .medium))
                        .frame(height: UIScreen.main.bounds.height * 0.12)
                    
                    Divider()
                    
                    List {
                        ForEach(0..<6) { item in
                            HStack {
                                Text("John Doe")
                                    .font(.system(size: 16, weight: .medium))
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                        
                                        Button(action: {}) {
                                            HStack {
                                                Image("")
                                                
                                                Text("Mark As Present")
                                                    .font(.system(size: 16, weight: .medium))
                                                
                                                
                                            }
                                        }
                                        .tint(Color.green)
                                    }
                                    .swipeActions(edge: .leading, allowsFullSwipe: false) {
                                        
                                        Button(action: {}) {
                                            Text("Mark As Absent")
                                                .font(.system(size: 16, weight: .medium))
                                            
                                        }
                                        .tint(.red)
                                    }
                            }
                            .background(.red)
                        }
                    }
                    .listStyle(.plain)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 29)
                        .stroke(Color.primaryRed, lineWidth: 2)
                }
            }
            .padding(.horizontal, 20)
            
            Spacer()
        }
    }
}

#Preview {
    TakeAttendanceView()
}
