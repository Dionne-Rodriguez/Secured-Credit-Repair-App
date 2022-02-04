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
    
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    Button(action: {
                        self.sourceType = .photoLibrary
                        self.isImagePickerDisplay.toggle()
                    }) {
                        Image(systemName: "camera")
                            .font(.system(size: 50))
                            .foregroundColor(Color(red: 68 / 255, green: 159 / 255, blue: 100 / 255))
                            .padding()
                    }
                    
                    Text("Tap icon above to take a picture")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                }
                .padding(.bottom, 100)
                     
                
                VStack {
                    Spacer()
                    
                    HStack() {
                        if image != nil {
                            
                            Text("W2.jpeg:")
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
                    
                    NavigationLink(destination:LoanUploadIncomeDocuments(loanApplicationService: loanApplicationService), isActive: $loanApplicationService.uploadComplete){EmptyView()}
                    
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
    }
    
    
    func submit() {
        if image != nil {
            var data = NSData()
            data = image!.jpegData(compressionQuality: 0.8)! as NSData
            loanApplicationService.uploadImage(image: data as Data, fileName: Document.W2)
        }
    }
    
    func didDismiss() {
        if image != nil {
            self.disableBtn = false
        }
    }
    
}

struct UploadW2_Previews: PreviewProvider {
    static var previews: some View {
        UploadW2(loanApplicationService: LoanApplicationService())
    }
}

extension View {
    @ViewBuilder func W2ProgressBarViewIsHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }
}
