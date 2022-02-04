//
//  LoanApplicationModel.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 11/30/21.
//

import Foundation

struct LoanApplication: Identifiable {
    var id: String
    var requestLoanAmount: String
    var firstName: String
    var lastName: String
    var email: String
    var phoneNumber: String
    var DOB: Date
    
    var USCitizen: String
    
    var CreditScore: String
    
    var AnnualIncome: String
    
    var Inquiries: String
    
    var NewCreditLines: String
    
    var Bankruptcy: String
    
    var DerogatoryReport: String
    
    var Documents: LoanDocuments
}
