//
//  UploadW2.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 1/1/22.
//
import SwiftUI

struct UploadW2: View {
    @ObservedObject var loanApplicationService: LoanApplicationService
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State var image: UIImage? = nil
    @State private var isImagePickerDisplay = false
    @State private var disableBtn = true
    @State var backToDocumentsUploadView: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                self.sourceType = .photoLibrary
                self.isImagePickerDisplay.toggle()
            }) {
                Image(systemName: "camera")
                    .font(.system(size: 50))
                    .foregroundColor(Color(red: 68 / 255, green: 159 / 255, blue: 100 / 255))
                    .padding()
            }
            
            Text("W2")
                .bold()
                .font(.title3)
                .padding()
  
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
                NavigationLink(destination: LoanUploadIncomeDocuments(loanApplicationService: loanApplicationService), isActive: $backToDocumentsUploadView)
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
            loanApplicationService.uploadImage(image: data as Data, fileName: Document.W2, side: "")
            }
        }
    
    private var isContinueButtonActive: Binding<Bool> { Binding (
        get: { loanApplicationService.loanApplicationForm.Documents.W2.count >= 1 },
        set: { if !$0 { backToDocumentsUploadView = true; loanApplicationService.W2StepCompletedIcon = "checkmark" } }
        )
    }
    
}

struct UploadW2_Previews: PreviewProvider {
    static var previews: some View {
        UploadW2(loanApplicationService: LoanApplicationService())
    }
}
