//
//  DataPoint.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 09/02/1447 AH.
//

import Foundation

struct DataPoint: Identifiable {
    
    let id = UUID()
    let month: String
    let value: Double
    let category: String
}
