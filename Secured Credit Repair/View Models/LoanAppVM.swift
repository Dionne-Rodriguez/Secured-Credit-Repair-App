
//
//  LoanApplicationManager.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 11/30/21.
//

import Foundation

class LoanApplicationService: ObservableObject {
    
    @Published var loanApplicationForm: LoanApplication = LoanApplication( requestLoanAmount:"$0.00", firstName: "", lastName: "", phoneNumber: "", SSN: "", DOB: Date(),USCitizen: "", CreditScore: "", AnnualIncome: "", Inquiries: "",
                                                                           NewCreditLines: "",Bankruptcy: "",
                                                                           DerogatoryReport: "",
                                                                           CreditCardBalance:"" )

    
    var disableLoanAmountBtn:Bool {
        return loanApplicationForm.requestLoanAmount == "$0.00"
    }
    
    var disablePersonalInformationNextBtn:Bool {
        return loanApplicationForm.firstName.isEmpty || loanApplicationForm.lastName.isEmpty || loanApplicationForm.SSN.isEmpty || loanApplicationForm.phoneNumber.isEmpty
    }
    
    init() {
        
    }
    
}

