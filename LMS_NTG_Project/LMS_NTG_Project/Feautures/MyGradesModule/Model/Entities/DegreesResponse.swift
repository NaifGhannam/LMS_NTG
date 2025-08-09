//
//  DegreesResponse.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 06/02/1447 AH.
//

import Foundation

struct DegreesResponse: Codable {
    
    let degreeId: Int
    let referenceId: Int
    let student: Student
    let degree: Int
    let type: String
    let value: String
    let referenceObject: ReferenceObject
}

struct Student: Codable {
    
    let studentId: Int
    let user: Users
    let grade: Grades
    let studentClass: StudentClass
}

struct Users: Codable {
    
    let userId: Int
    let firstName: String
    let middleName: String
    let lastName: String
    let gender: String
    let address: String
    let birthDate: String
    let phoneNumber: String
    let photo: String
    let nationalId: String
    let isDeleted: Bool
    let joinedOn: String
    let leftOn: String
}

struct Grades: Codable {
    
    let gradeId: Int
    let gradeName: String
}

struct StudentClass: Codable {
    
    let classId: Int
    let className: String
    let grade: Grades
}

struct ReferenceObject: Codable {
}
