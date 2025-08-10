//
//  Status.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 16/02/1447 AH.
//


import Foundation

enum Status: String, CaseIterable, Identifiable {
    
    case live, coming, completed
    var id: Self { self }
}
