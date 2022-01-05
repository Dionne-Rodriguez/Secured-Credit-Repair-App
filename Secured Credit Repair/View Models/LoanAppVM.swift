
//
//  LoanApplicationManager.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 11/30/21.
//

import Foundation
import FirebaseStorage

import SwiftUI
import FirebaseFirestore
import Firebase

final class LoanApplicationService: ObservableObject {
    
    @Published var loanApplicationForm: LoanApplication = LoanApplication( id: UUID().uuidString, requestLoanAmount:"$0.00", firstName: "", lastName: "", phoneNumber: "", DOB: Date(),USCitizen: "", CreditScore: "", AnnualIncome: "", Inquiries: "",
      NewCreditLines: "",Bankruptcy: "", DerogatoryReport: "", Documents: LoanDocuments(DriverLisence: [], SocialSecurityCard: [], UtilityBill: [], W2: [], PayStubs: [], BankStatements: []))
    
    func submitApplication() {
     print(" Submit app data \(loanApplicationForm)")
        let db = Firestore.firestore()
        db.collection("Application").addDocument(data: ["requestLoanAmount": loanApplicationForm.requestLoanAmount,
                                                        "firstName": loanApplicationForm.firstName,
                                                        "lastName": loanApplicationForm.lastName,
                                                        "phoneNumber": loanApplicationForm.phoneNumber,
                                                        "DOB": loanApplicationForm.DOB,
                                                        "isUSCitizen": loanApplicationForm.USCitizen,
                                                        "creditLineOpeninLast6Months": loanApplicationForm.NewCreditLines,
                                                        "creditScoreAbove620": loanApplicationForm.CreditScore,
                                                        "incomeEligibe":loanApplicationForm.AnnualIncome,
                                                        "hasDeragatoryReports": loanApplicationForm.DerogatoryReport,
                                                        "hasInquiries": loanApplicationForm.Inquiries,
                                                        "bankruptcy": loanApplicationForm.Bankruptcy,
                                                        "driverLisenceDocuments": loanApplicationForm.Documents.DriverLisence,
                                                        "socialSecurityCardDocuments": loanApplicationForm.Documents.SocialSecurityCard,
                                                        "utilityBillDocuments": loanApplicationForm.Documents.UtilityBill,
                                                        "W2Documents": loanApplicationForm.Documents.W2,
                                                        "paystubDocuments": loanApplicationForm.Documents.PayStubs,
                                                        "bankStatementsDocuments": loanApplicationForm.Documents.BankStatements])
        { err in
            if err == nil {
                print("Document added")
                
            } else {
                print("Error adding document: \(String(describing: err))")
            }
        }
    }
    
    var DriverLicenseStepCompletedIcon: String?
    var SocialSecurityCardStepCompletedIcon: String?
    var UtilityBillStepCompletedIcon: String?
    var W2StepCompletedIcon: String?
    var PayStubStepCompletedIcon: String?
    var BankStatementsCompletedIcon: String?
    
    var showSubmitApplicationBtn: Bool {
        return (DriverLicenseStepCompletedIcon != nil) && (SocialSecurityCardStepCompletedIcon != nil) && (UtilityBillStepCompletedIcon != nil) && (W2StepCompletedIcon != nil) && (PayStubStepCompletedIcon != nil) && (BankStatementsCompletedIcon != nil)
    }
    
    var disableLoanAmountBtn:Bool {
        return loanApplicationForm.requestLoanAmount == "$0.00"
    }
    
    var disablePersonalInformationNextBtn:Bool {
        return loanApplicationForm.firstName.isEmpty || loanApplicationForm.lastName.isEmpty || loanApplicationForm.phoneNumber.isEmpty
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
            DriverLicenseStepCompletedIcon = "checkmark"
            self.loanApplicationForm.Documents.DriverLisence.append(url.absoluteString)
        }
        if(fileName == Document.SocialSecurityCard) {
            SocialSecurityCardStepCompletedIcon = "checkmark"
            self.loanApplicationForm.Documents.SocialSecurityCard.append(url.absoluteString)
        }
        if(fileName == Document.UtilityBill) {
            UtilityBillStepCompletedIcon = "checkmark"
            self.loanApplicationForm.Documents.UtilityBill.append(url.absoluteString)
        }
        if(fileName == Document.W2) {
            W2StepCompletedIcon = "checkmark"
            self.loanApplicationForm.Documents.W2.append(url.absoluteString)
        }
        if(fileName == Document.PayStubs) {
            PayStubStepCompletedIcon = "checkmark"
            self.loanApplicationForm.Documents.PayStubs.append(url.absoluteString)
            print(loanApplicationForm.Documents.PayStubs)
        }
        if(fileName == Document.BankStatements) {
            BankStatementsCompletedIcon = "checkmark"
            self.loanApplicationForm.Documents.BankStatements.append(url.absoluteString)
        }
        
    }
    
    

    
    init() {
        
    }
    
}

