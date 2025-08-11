//
//  StudentServiceProtocol.swift
//  LMS_NTG_Project
//
//  Created by Naif on 09/02/1447 AH.
//



protocol StudentServiceProtocol {
    func getStudentInfo(id : Int) async throws -> StudentRespons
    
}
