//
//  Progress.swift
//  
//
//  Created by Naif on 26/01/1447 AH.
//


//
//  Progress.swift
//  LMS_NTG_Project
//
//  Created by Naif on 26/01/1447 AH.
//

import SwiftUI

struct Progress: View {
    @State var progress: Double = 0.9
    
    var body: some View {
                VStack() {
                    
                    Text("Progress \(Int(progress * 100))%")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundStyle(Color("PrimaryRed"))
                        .padding(.top ,)
                    
                    ProgressView(value: progress)
                        .progressViewStyle(LinearProgressViewStyle(tint: Color("PrimaryRed")))
                        .padding()
                        .padding(.bottom , 10)
                    
                }
                .frame(maxWidth: .infinity , maxHeight: UIScreen.main.bounds.size.height * 0.20)
                .background(Color("DarkPink"))
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.3), radius: 5, y: 3)
    
    }
}


#Preview {
    StudentDashboardView()
}
