//
//  RecentActivityView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 20/01/1447 AH.
//

import SwiftUI

struct RecentActivityView: View {
    var body: some View {
    
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                
                Text("Recent Activity Log")
                    .font(.title)
                    .foregroundColor(Color("PrimaryRed"))
                    .padding(.bottom, 10)
                    .bold()
                
                HStack {
                    Text("Time")
                    Spacer()
                    Text("User")
                    Spacer()
                    Text("Action")
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
                .background(.white)
                .foregroundColor(.gray)
                .font(.title2)
                .cornerRadius(20)
                
                VStack {
                    
                    ForEach(1...4, id: \.self) { _ in
                        HStack {
                            Text("4:00AM")
                            Spacer()
                            Text("User1")
                            Spacer()
                            Text("Login")
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                        .background(Color.white)
                    }
                }
                .background(Color.white)
                .cornerRadius(20)
            }
            .padding(.horizontal, 25)
        }
    }
}

#Preview {
    RecentActivityView()
}
