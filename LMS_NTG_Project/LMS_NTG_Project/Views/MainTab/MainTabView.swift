//
//  MainTabView.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 25/01/1447 AH.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        
        TabView {
            
            Admin_dashoard()
                .tabItem {
                    Image(systemName: "house")
                    Text("Dashboard")
                }
            
            UserMangementView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("User Management")
                }
        }
        .tint(Color("PrimaryRed"))
    }
}

#Preview {
    MainTabView()
}
