//
//  SessionServiceProtocol.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 11/02/1447 AH.
//

import Foundation

protocol SessionServiceProtocol {
    func sessionScheduling(classEntity: ClassEntity, gradeSubject: GradesSubject, sessionDate: String, sessionNumber: Int, type: String, status: String) async throws -> SessionResponse
    func getGradeSubjects() async throws -> [GradeSubjects]
    func getAllClasses() async throws -> [SchoolClass]
}
