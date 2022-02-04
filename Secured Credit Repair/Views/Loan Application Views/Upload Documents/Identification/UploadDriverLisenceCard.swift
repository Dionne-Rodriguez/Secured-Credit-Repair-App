//
//  UploadCard.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 12/13/21.
//

import SwiftUI

struct UploadDriverLicenseCardView: View {
    @ObservedObject var loanApplicationService: LoanApplicationService
    @State private var disableBtn = true
    @State var displayPopup: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State var image: UIImage? = nil
    @State private var isImagePickerDisplay = false
    var systemName: String
    var fileName : Document
    var viewTitle: String
    var side: String
    
    
    
    var body: some View {
        VStack {
            ZStack {
                VStack {
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
                    
                    Text("We need a picture of the \(self.side) of your card")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                    
                    Text("Tap icon above to take a picture")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                }
                .padding(.bottom, 100)
                
                
                
                
                
                VStack {
                    Spacer()
                    
                    HStack() {
                        if image != nil {
                            
                            Text("Drivers-License.jpeg:")
                                .padding(.leading)
                            Text("selected")
                            Image(systemName:"checkmark")
                        }
                        
                        
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    Button(action:{submit()}) {
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
                        
                    }.disabled(disableBtn)
                        .padding(.top, 20)
                        .navigationTitle("back")
                    
                    NavigationLink(destination:UploadDriverLicenseCardView(loanApplicationService: loanApplicationService, systemName: "arrow.triangle.2.circlepath.circle", fileName: fileName, viewTitle: "Back card", side: "back side"), isActive: $loanApplicationService.frontDLUploaded){EmptyView()}
                    
                    NavigationLink(destination:LoanUploadIdentityDocuments(loanApplicationService: loanApplicationService), isActive:
                                    $loanApplicationService.uploadComplete){EmptyView()}
                    
                }
                GeometryReader {_ in
                    
                    Color.clear
                        .modifier(Popup(isPresented: loanApplicationService.progressBar,
                                        content: { ProgressBar(uploadProgress: loanApplicationService.uploadAmount) }))
                }.background(
                    Color.black.opacity(0.65)
                        .edgesIgnoringSafeArea(.all)
                )
                    .DLProgressBarViewIsHidden(loanApplicationService.hideProgressBar)
            }
            .sheet(isPresented: self.$isImagePickerDisplay, onDismiss: didDismiss) {
                ImagePickerView(selectedImage: self.$image, sourceType: self.sourceType)
            }
        }
        .onAppear(perform: reset)
        
    }
    
    func reset() {
        loanApplicationService.frontDLUploaded = false
        loanApplicationService.uploadComplete = false
    }
    
    func submit() {
        if image != nil {
            var data = NSData()
            data = image!.jpegData(compressionQuality: 0.8)! as NSData
            loanApplicationService.uploadImage(image: data as Data, fileName: fileName, side: side)
        }
    }
    
    func didDismiss() {
        if image != nil {
            self.disableBtn = false
        }
    }
    
}
struct UploadCard_Previews: PreviewProvider {
    static var previews: some View {
        UploadDriverLicenseCardView(loanApplicationService: LoanApplicationService(), systemName: "camera", fileName: Document.SocialSecurityCard, viewTitle: "Front card", side: "Front Side")
    }
}

extension View {
    @ViewBuilder func DLProgressBarViewIsHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }
}
