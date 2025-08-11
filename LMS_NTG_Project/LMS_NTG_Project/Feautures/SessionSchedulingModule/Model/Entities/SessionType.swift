//
//  SessionType.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 16/02/1447 AH.
//

import Foundation

enum SessionType: String, CaseIterable, Identifiable {
    
    case theoretical, practical
    var id: Self { self }
}
