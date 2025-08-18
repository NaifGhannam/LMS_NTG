//
//  ListOfClasses.swift
//  LMS_NTG_Project
//
//  Created by Naif on 17/02/1447 AH.
//

import SwiftUI
struct ListOfClasses: View {
    
    var toDayClasses: [ToDayClass]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Today's Classes")
                .font(.headline)
                .padding(.bottom, 5)
            
            VStack(spacing: 0) {
                ForEach(toDayClasses) { item in
                    HStack {
                        Text(item.time)
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.system(size: 14, weight: .bold))
                            Text(item.room)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        
                        Text(item.status.displayText)
                            .font(.caption)
                            .foregroundColor(item.status.color)
                            .padding(6)
                            .background(item.status.color.opacity(0.2))
                            .cornerRadius(5)
                    }
                    .padding(.vertical, 8)
                    
                    Divider()
                }
            }
        }
        .padding(.horizontal)
    }
}
import SwiftUI

enum ClassStatus: String {
    case coming = "Coming"
    case upcoming = "Upcoming"
    case finished = "Finished"
    
    var displayText: String {
        switch self {
        case .coming: return "In Coming"
        case .upcoming: return "Up Coming"
        case .finished: return "Finished"
        }
    }
    
    var color: Color {
        switch self {
        case .coming: return .green
        case .upcoming: return .blue
        case .finished: return .red
        }
    }
}
