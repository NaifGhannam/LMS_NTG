//
//  MyGradesView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 27/01/1447 AH.
//

import SwiftUI

struct MyGradesView: View {
    
    var action: (() -> ())?
    
    var body: some View {
        ZStack {
            
            Color("PrimaryRed")
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                HStack(alignment: .bottom, spacing: 0) {
                    
                    Button(action: {action?()}) {
                        Image("right-chevron")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                    
                    Text("My Grades")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    
                    Spacer()
                        .frame(width: 25, height: 25)
                }
                .frame(height: UIScreen.main.bounds.size.height * 0.1)
                .padding(20)
                .padding(.bottom)
                
                Spacer()
                
                ZStack {
                    
                    Color("PrimaryLightPink")
                        .clipShape(RoundedCorner(radius: 40, corners: [.topLeft]))
                    
                    VStack(spacing: 16) {
                        
                        HStack {
                            Spacer()
                            
                            HStack {
                                Button(action: {}) {
                                    
                                    Text("filter by")
                                        .foregroundColor(.black.opacity(0.6))
                                    
                                    Spacer()
                                    
                                    Image("filter")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                }
                            }
                            .padding(12)
                            .background(.white)
                            .cornerRadius(12)
                            .frame(width: 140)
                        }
                        .padding(.vertical, 20)
                        
                        ForEach(1...5, id: \.self) { _ in
                            HStack(spacing: 22) {
                                Image(systemName: "abc")
                                    .foregroundColor(Color("PrimaryRed"))
                                
                                Text("English")
                                
                                Spacer()
                                
                                Text("A")
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(.red)
                                    .shadow(color: .black.opacity(0.3), radius: 5, y: 3)
                            }
                            .padding(18)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.white)
                            .cornerRadius(12)
                        }
                        
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.red, lineWidth: 2)
                            .background(.white)
                            .cornerRadius(10)
                            .frame(width: 110, height: 60)
                            .overlay {
                                Text("GPA: 3.5")
                                    .font(.title3)
                            }
                            .padding(.top, 20)
                            
                        Spacer()
                        
                        HStack {
                            Spacer()
                            
                            Button(action: {}) {
                                Image(systemName: "square.and.arrow.down")
                                    .resizable()
                                    .frame(width: 25, height: 30)
                                    .foregroundColor(.primaryRed)
                            }
                        }
                        .padding()
                        
                        Spacer()
                        
                    }
                    .padding(28)
                }
                .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    MyGradesView()
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
