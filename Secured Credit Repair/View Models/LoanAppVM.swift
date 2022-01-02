
//
//  LoanApplicationManager.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 11/30/21.
//

import Foundation
import FirebaseStorage
import SwiftUI

final class LoanApplicationService: ObservableObject {
    
    @Published var loanApplicationForm: LoanApplication = LoanApplication( requestLoanAmount:"$0.00", firstName: "", lastName: "", phoneNumber: "", SSN: "", DOB: Date(),USCitizen: "", CreditScore: "", AnnualIncome: "", Inquiries: "",
                                                                           NewCreditLines: "",Bankruptcy: "",
                                                                           DerogatoryReport: "",
                                                                           CreditCardBalance:"", Documents: LoanDocuments(DriverLisence: [], SocialSecurityCard: [], UtilityBill: [], W2: [], PayStubs: []))
    
  
    
    var driverLicenseStepCompletedIcon: String?
    var socialSecurityCardStepCompletedIcon: String?
    var UtilityBillStepCompletedIcon: String?
    var W2StepCompletedIcon: String?
    var PayStubStepCompletedIcon: String?
    
    var disableLoanAmountBtn:Bool {
        return loanApplicationForm.requestLoanAmount == "$0.00"
    }
    
    var disablePersonalInformationNextBtn:Bool {
        return loanApplicationForm.firstName.isEmpty || loanApplicationForm.lastName.isEmpty || loanApplicationForm.SSN.isEmpty || loanApplicationForm.phoneNumber.isEmpty
    }
    
    func uploadFile(file:URL,fileName:String) {
        let storage = Storage.storage()
        storage.reference().child("docs/\(fileName)").putFile(from: file, metadata: nil) {_ , error in
            storage.reference().child("docs").downloadURL { (url,error) in
                guard let downloandUrl = url else {
                    return
                }
                print(downloandUrl)
            }
        }
    }
    
    func uploadImage(image:Data,fileName:Document, side: String = "") {
        let storage = Storage.storage()
        storage.reference().child("docs/\(fileName)\(side)").putData(image, metadata: nil) {_ , error in
            storage.reference().child("docs/\(fileName)\(side)").downloadURL { (url,error) in
                guard let downloadURL = url else {
                    return
                  }
                self.saveDownloadUrl(url: downloadURL, fileName: fileName)
            }
        }
    }
    
    func saveDownloadUrl(url: URL, fileName: Document) {
        
        if(fileName == Document.DriverLisence) {
            self.loanApplicationForm.Documents.DriverLisence.append(url)
        }
        if(fileName == Document.SocialSecurityCard) {
            self.loanApplicationForm.Documents.SocialSecurityCard.append(url)
        }
        if(fileName == Document.UtilityBill) {
            UtilityBillStepCompletedIcon = "checkmark"
            self.loanApplicationForm.Documents.UtilityBill.append(url)
        }
        if(fileName == Document.W2) {
            W2StepCompletedIcon = "checkmark"
            self.loanApplicationForm.Documents.W2.append(url)
        }
        if(fileName == Document.PayStubs) {
            PayStubStepCompletedIcon = "checkmark"
            self.loanApplicationForm.Documents.PayStubs.append(url)
            print(loanApplicationForm)
        }
        
        
    }

    
    init() {
        
    }
    
}

