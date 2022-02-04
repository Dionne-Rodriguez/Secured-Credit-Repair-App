import Foundation
import FirebaseStorage

import SwiftUI
import FirebaseFirestore
import Firebase

final class LoanApplicationService: ObservableObject {
    
    @Published var loanApplicationForm: LoanApplication = LoanApplication( id: UUID().uuidString, requestLoanAmount:"$0.00", firstName: "", lastName: "", email: "", phoneNumber: "", DOB: Date(), USCitizen: "", CreditScore: "", AnnualIncome: "", Inquiries: "",
                                                                           NewCreditLines: "" ,Bankruptcy: "", DerogatoryReport: "", Documents: LoanDocuments(DriverLicense: [], SocialSecurityCard: [], UtilityBill: [], W2: [], PayStubs: [], BankStatements: []))
    
    var DriverLicenseStepCompletedIcon: String?
    var SocialSecurityCardStepCompletedIcon: String?
    var UtilityBillStepCompletedIcon: String?
    var W2StepCompletedIcon: String?
    var PayStubStepCompletedIcon: String?
    var BankStatementsCompletedIcon: String?
    @Published var frontDLUploaded: Bool = false
    @Published var frontSCUploaded: Bool = false
    @Published var progressBar: Bool = false
    @Published var hideProgressBar: Bool = true
    @Published var uploadComplete: Bool = false
    @Published var uploadAmount:Double = 0.0000
    @Published var totalProgress: Progress = Progress(totalUnitCount: Int64(100))
    var selection: Int?
    
   @Published var applicationComplete: Bool = false
    
    
    
    
    
    
    var showSubmitApplicationBtn:Bool {
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
        let uploadTask = storage.reference().child("docs/\(fileName)").putFile(from: file, metadata: nil) {_ , error in
            storage.reference().child("docs").downloadURL { (url,error) in
                guard let downloandUrl = url else {
                    return
                }
                print(downloandUrl)
            }
        }
        uploadTask.observe(.progress) { snapshot in
            print(snapshot)
        }
    }
    
    func submitImages(selected:[SelectedImages] , fileName:Document) {
        let imageCount = selected.count
        
        if imageCount >= 1 {
            var data = NSData()
            var iteration: Int = 0
            for i in selected {
                data = i.image.jpegData(compressionQuality: 0.8)! as NSData
                uploadImages(image: data as Data, fileName: fileName, side: String(iteration), imageUploadSize: imageCount)
                iteration += 1
            }
        }
    }
    
    func uploadImages(image:Data,fileName:Document, side: String = "", imageUploadSize: Int) {
        
        self.progressBar = true
        self.hideProgressBar = false
        
        print("Progress bar \(progressBar) hideProgressBar \(hideProgressBar)")
        
        let storage = Storage.storage()
        
        let uploadTask = storage.reference().child("docs/\(fileName)\(side)").putData(image, metadata: nil) {_ , error in
            storage.reference().child("docs/\(fileName)\(side)").downloadURL { (url,error) in
                guard let downloadURL = url else {
                    return
                }
                
                self.saveDownloadUrl(url: downloadURL, fileName: fileName, imageUploadSize: imageUploadSize)
            }
        }
        uploadTask.observe(.progress) { (snapshot) in
            if let p = snapshot.progress {

            }
        }
    }
    
    
    
    func uploadImage(image:Data,fileName:Document, side: String = "") {
        self.progressBar.toggle()
        self.hideProgressBar.toggle()
        
        let storage = Storage.storage()
        let uploadTask = storage.reference().child("docs/\(fileName)\(side)").putData(image, metadata: nil) {_ , error in
            storage.reference().child("docs/\(fileName)\(side)").downloadURL { (url,error) in
                guard let downloadURL = url else {
                    return
                }
                
                self.saveDownloadUrl(url: downloadURL, fileName: fileName, imageUploadSize: 0)
            }
        }
        uploadTask.observe(.progress) { snapshot in
            self.uploadAmount = snapshot.progress!.fractionCompleted
            if (self.uploadAmount == 1.00) {
                self.hideProgressBar = true
                self.progressBar = false
                self.uploadAmount = 0.0000
            }
        }
    }
    
    func saveDownloadUrl(url: URL, fileName: Document, imageUploadSize: Int?) {
        if(fileName == Document.DriverLicense) {
            self.loanApplicationForm.Documents.DriverLicense.append(url.absoluteString)
            
            if(self.loanApplicationForm.Documents.DriverLicense.count >= 2) {
                DriverLicenseStepCompletedIcon = "checkmark"
                uploadComplete = true
                return
            } else {
                frontDLUploaded = true
            }
            
        }
        if(fileName == Document.SocialSecurityCard) {
            self.loanApplicationForm.Documents.SocialSecurityCard.append(url.absoluteString)
            
            if(self.loanApplicationForm.Documents.SocialSecurityCard.count >= 2) {
                SocialSecurityCardStepCompletedIcon = "checkmark"
                uploadComplete = true
                return
            } else {
                frontSCUploaded = true
            }
            
        }
        if(fileName == Document.UtilityBill) {
            self.loanApplicationForm.Documents.UtilityBill.append(url.absoluteString)
            if(self.loanApplicationForm.Documents.UtilityBill.count >= 1) {
                UtilityBillStepCompletedIcon = "checkmark"
                uploadComplete = true
            }
        }
        if(fileName == Document.W2) {
            
            self.loanApplicationForm.Documents.W2.append(url.absoluteString)
            if(self.loanApplicationForm.Documents.W2.count >= 1) {
                W2StepCompletedIcon = "checkmark"
                uploadComplete = true
            }
        }
        if(fileName == Document.PayStubs) {
            totalProgress.totalUnitCount = Int64(imageUploadSize ?? 0)
            self.loanApplicationForm.Documents.PayStubs.append(url.absoluteString)
            
            totalProgress.completedUnitCount = Int64(self.loanApplicationForm.Documents.PayStubs.count)
            
            self.uploadAmount = totalProgress.fractionCompleted
            if(totalProgress.isFinished) {
                PayStubStepCompletedIcon = "checkmark"
                uploadComplete = true
                self.hideProgressBar = true
                self.progressBar = false
                self.uploadAmount = 0.0000
            }
        }
        if(fileName == Document.BankStatements) {
            totalProgress.totalUnitCount = Int64(imageUploadSize ?? 0)
            self.loanApplicationForm.Documents.BankStatements.append(url.absoluteString)
            
            totalProgress.completedUnitCount = Int64(self.loanApplicationForm.Documents.BankStatements.count)
            
            self.uploadAmount = totalProgress.fractionCompleted
            
            if(totalProgress.isFinished) {
                BankStatementsCompletedIcon = "checkmark"
                uploadComplete = true
                self.hideProgressBar = true
                self.progressBar = false
                self.uploadAmount = 0.0000
            }
            
        }
        
    }
    
    func transformDate(date: Date) -> String {
        let formatter1 = DateFormatter()
        formatter1.dateStyle = .short
        return formatter1.string(from: date)
    }
    
    func submitApplication() {
        let db = Firestore.firestore()
        db.collection("Application").addDocument(data: ["requestLoanAmount": loanApplicationForm.requestLoanAmount,
                                                        "firstName": loanApplicationForm.firstName,
                                                        "lastName": loanApplicationForm.lastName,
                                                        "email": loanApplicationForm.email,
                                                        "phoneNumber": loanApplicationForm.phoneNumber,
                                                        "DOB": transformDate(date:loanApplicationForm.DOB),
                                                        "isUSCitizen": loanApplicationForm.USCitizen,
                                                        "creditLineOpeninLast6Months": loanApplicationForm.NewCreditLines,
                                                        "creditScoreAbove620": loanApplicationForm.CreditScore,
                                                        "incomeEligibe":loanApplicationForm.AnnualIncome,
                                                        "hasDeragatoryReports": loanApplicationForm.DerogatoryReport,
                                                        "hasInquiries": loanApplicationForm.Inquiries,
                                                        "bankruptcy": loanApplicationForm.Bankruptcy,
                                                        "driverLicenseDocuments": loanApplicationForm.Documents.DriverLicense,
                                                        "socialSecurityCardDocuments": loanApplicationForm.Documents.SocialSecurityCard,
                                                        "utilityBillDocuments": loanApplicationForm.Documents.UtilityBill,
                                                        "W2Documents": loanApplicationForm.Documents.W2,
                                                        "paystubDocuments": loanApplicationForm.Documents.PayStubs,
                                                        "bankStatementsDocuments": loanApplicationForm.Documents.BankStatements])
        { err in
            if err == nil {
                self.applicationComplete = true
                
            } else {
                print("Error adding document: \(String(describing: err))")
            }
        }
        print(" Submitted Data\(loanApplicationForm)")
    }
    
    
    
    
    init() {
        
    }
    
}
