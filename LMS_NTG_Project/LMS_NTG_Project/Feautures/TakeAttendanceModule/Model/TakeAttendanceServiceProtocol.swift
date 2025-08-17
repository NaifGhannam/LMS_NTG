//
//  TakeAttendanceServiceProtocol.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 23/02/1447 AH.
//

import Foundation

protocol TakeAttendanceServiceProtocol {
    func getStudent(id: Int) async throws -> [StudentRespons]
}
