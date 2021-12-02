
//
//  LoanApplicationManager.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 11/30/21.
//

import Foundation

class LoanApplicationService: ObservableObject {
    
    @Published var loanApplicationForm: LoanApplication = LoanApplication(requestLoanAmount:"", firstName: "", lastName: "", phoneNumber: "", SSN: "", DOB: Date())
    
    
    init() {
        
    }
    
}

