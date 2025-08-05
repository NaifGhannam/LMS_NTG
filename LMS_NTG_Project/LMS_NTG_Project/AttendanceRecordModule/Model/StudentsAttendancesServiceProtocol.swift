//
//  StudentsAttendancesServiceProtocol.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 09/02/1447 AH.
//

import Foundation

protocol StudentsAttendancesServiceProtocol {
    func getStudentsAttendances(id: Int) async throws -> StudentsAttendancesResponse
}
