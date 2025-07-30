//
//  VerifyResetCodeViewModel.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 05/02/1447 AH.
//

import Foundation

@MainActor
class VerifyResetCodeViewModel: ObservableObject {
    
    @Published var code: String = ""
    
    @Published var isLoading: Bool = false
    @Published var status: String?
    @Published var errorMessage: String?
    
    private var verifyResetCodeService: VerifyResetCodeServiceProtocol
    
    init(verifyResetCodeService: VerifyResetCodeServiceProtocol = VerifyResetCodeService()) {
        
        self.verifyResetCodeService = verifyResetCodeService
    }
    
    func verifyResetCode() async {
        
        self.isLoading = true
        self.errorMessage = nil
        
        do {
            let result = try await verifyResetCodeService.verifyResetCode(code: code)
            
            self.status = result.status
        } catch {
            self.errorMessage = error.localizedDescription
        }
        
        self.isLoading = false
    }
}
