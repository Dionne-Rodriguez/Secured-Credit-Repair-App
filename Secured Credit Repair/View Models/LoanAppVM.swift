
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
    
    @Published var loanApplicationForm: LoanApplication = LoanApplication( id: UUID().uuidString, requestLoanAmount:"$0.00", firstName: "", lastName: "", phoneNumber: "", SSN: "", DOB: Date(),USCitizen: "", CreditScore: "", AnnualIncome: "", Inquiries: "",
                                                                           NewCreditLines: "",Bankruptcy: "",
                                                                           DerogatoryReport: "",
                                                                           CreditCardBalance:"", Documents: LoanDocuments(DriverLisence: [], SocialSecurityCard: [], UtilityBill: [], W2: [], PayStubs: [], BankStatements: []))
    
    func submitApplication() {
     print(" Submit app data \(loanApplicationForm)")
        let db = Firestore.firestore()
        db.collection("Application").addDocument(data: ["Request Loan Amount": loanApplicationForm.requestLoanAmount,
                                                        "First Name": loanApplicationForm.firstName,
                                                        "Last Name": loanApplicationForm.lastName,
                                                        "Phone Number": loanApplicationForm.phoneNumber,
                                                        "Social Security Number": loanApplicationForm.SSN,
                                                        "Date of Birth": loanApplicationForm.DOB,
                                                        "US Citizen": loanApplicationForm.USCitizen,
                                                        "Credit Score": loanApplicationForm.CreditScore,
                                                        "Annual Income": loanApplicationForm.AnnualIncome,
                                                        "Inquiries": loanApplicationForm.Inquiries,
                                                        "New Credit Lines Open": loanApplicationForm.NewCreditLines,
                                                        "Derogatory Reports": loanApplicationForm.DerogatoryReport,
                                                        "Credit Card Balance": loanApplicationForm.CreditScore,
                                                        "Driver Lisence Documents": loanApplicationForm.Documents.DriverLisence,
                                                        "Social Security Card Documents": loanApplicationForm.Documents.SocialSecurityCard,
                                                        "Utility Bill Documents": loanApplicationForm.Documents.UtilityBill,
                                                        "W2 Documents": loanApplicationForm.Documents.W2,
                                                        "Paystub Documents": loanApplicationForm.Documents.PayStubs,
                                                        "Bank Statements Documents": loanApplicationForm.Documents.BankStatements])
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

