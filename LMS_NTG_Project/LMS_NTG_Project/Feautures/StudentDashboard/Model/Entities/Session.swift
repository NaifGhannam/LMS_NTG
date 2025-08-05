//
//  Session.swift
//  LMS_NTG_Project
//
//  Created by Naif on 09/02/1447 AH.
//

import Foundation



struct Session: Identifiable {
    
    let id: UUID = UUID()
    let title: String
    let date: String
    let time: String
}


