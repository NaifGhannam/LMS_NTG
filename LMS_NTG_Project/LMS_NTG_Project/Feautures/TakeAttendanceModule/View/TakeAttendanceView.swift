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
                .padding(.vertical, 8)
                
                VStack(alignment: .center, spacing: 0) {
                    
                    Text("Name")
                        .font(.system(size: 18, weight: .medium))
                        .frame(height: UIScreen.main.bounds.height * 0.11)
                    
                    
                    List {
                        ForEach(0..<10) { item in
                            
                            VStack(alignment: .center, spacing: 0) {
                                
                                Divider()
                                    .background(.black)
                                
                                Text("John Doe")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.black.opacity(0.65))
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 18)
                                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                        
                                        Button(action: {}) {
                                            HStack {
                                                Image("")
                                                
                                                Text("Mark As Present")
                                                    .font(.system(size: 16, weight: .medium))
                                            }
                                        }
                                        .tint(Color.primaryGreen)
                                    }
                                    .swipeActions(edge: .leading, allowsFullSwipe: false) {
                                        
                                        Button(action: {}) {
                                            Text("Mark As Absent")
                                                .font(.system(size: 16, weight: .medium))
                                            
                                        }
                                        .tint(Color.primaryRed)
                                    }
                            }
                        }
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                    }
                    .listStyle(.plain)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 29)
                        .stroke(Color.primaryRed, lineWidth: 2)
                }
                .cornerRadius(29)
                .padding(.horizontal, 18)
                
                Spacer()
                    .frame(height: 45)
                
                HStack {
                    Button(action: {}) {
                        Text("Clear Selection")
                            .font(.system(size: 16, weight: .semibold))
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 10)
                    .background(Color.primaryRed)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.6), radius: 4)
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Text("Save Attendance")
                            .font(.system(size: 16, weight: .semibold))
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 10)
                    .background(Color.primaryGreen)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.6), radius: 4)
                }
                .padding(.horizontal, 20)
            }
            .padding(.horizontal, 25)
            
            Spacer()
        }
    }
}

#Preview {
    TakeAttendanceView()
}
