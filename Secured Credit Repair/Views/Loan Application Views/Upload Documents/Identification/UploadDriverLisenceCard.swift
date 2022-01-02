//
//  UploadCard.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 12/13/21.
//

import SwiftUI

struct UploadDriverLisenceCardView: View {
    @ObservedObject var loanApplicationService: LoanApplicationService
    @State private var disableBtn = true
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State var image: UIImage? = nil
    @State private var isImagePickerDisplay = false
    @State var backToDocumentsUploadView: Bool = false
    var systemName: String
    var fileName : Document
    var viewTitle: String
    var side: String
    
    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                self.sourceType = .photoLibrary
                self.isImagePickerDisplay.toggle()
            }) {
                Image(systemName: "\(self.systemName)")
                    .font(.system(size: 50))
                    .foregroundColor(Color(red: 68 / 255, green: 159 / 255, blue: 100 / 255))
                    .padding()
            }
            
            Text("\(self.viewTitle)")
                .bold()
                .font(.title3)
                .padding()
            Text("We need picture of the \(self.side) of your card")
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.bottom)
            
            Text("Tap icon above to take a picture")
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            Spacer()
            
            Section {
            if image != nil {
                Image(uiImage: image!)
                    .resizable()
                    .frame(width: 350, height: 200)
            }
        }
            .frame(maxHeight: 400, alignment: .center)
            
            Button(action:{}) {
                NavigationLink(destination: destinationView)
                {
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(Color(red: 68 / 255, green: 159 / 255, blue: 100 / 255))
                        Text("Continue")
                        .font(.system(size: 21))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .frame(maxWidth:.infinity, alignment: .center)
                }
                .frame(height: 70)
                .padding(.horizontal, 15)
                .padding(.vertical, 15)
            }
            }.disabled(disableBtn)
            .navigationTitle("back")
        }
        .sheet(isPresented: self.$isImagePickerDisplay, onDismiss: didDismiss) {
            ImagePickerView(selectedImage: self.$image, sourceType: self.sourceType)
        }
    }
    
    func didDismiss() {
        if image != nil {
            self.disableBtn.toggle()
            var data = NSData()
            data = image!.jpegData(compressionQuality: 0.8)! as NSData
            loanApplicationService.uploadImage(image: data as Data, fileName: fileName, side: side)
            }
        }
    
    var destinationView: some View {
        if(loanApplicationService.loanApplicationForm.Documents.DriverLisence.count >= 2) {
            loanApplicationService.driverLicenseStepCompletedIcon = "checkmark"
            return AnyView(LoanUploadIdentityDocuments(loanApplicationService: loanApplicationService))
        }
        else {
            return AnyView(UploadDriverLisenceCardView(loanApplicationService: loanApplicationService, systemName: "arrow.triangle.2.circlepath.circle", fileName: fileName, viewTitle: "Back card", side: "back side"))
        }
    }
        
  
}
struct UploadCard_Previews: PreviewProvider {
    static var previews: some View {
        UploadDriverLisenceCardView(loanApplicationService: LoanApplicationService(), systemName: "camera", fileName: Document.SocialSecurityCard, viewTitle: "Front card", side: "Front Side")
    }
}
