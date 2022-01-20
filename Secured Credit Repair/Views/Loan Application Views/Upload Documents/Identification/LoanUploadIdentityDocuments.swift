//
//  UploadIdentityDocuments.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 12/11/21.
//

import SwiftUI

struct LoanUploadIdentityDocuments: View {
    @ObservedObject var loanApplicationService: LoanApplicationService
    
    
    var body: some View {
         VStack(alignment: .leading) {
            Image("ID-Card")
                .padding(.top)
                .padding(.leading)
                .frame(width: 300, height: 200)
            
            Text("Proof of identity")
                .bold()
                .font(.title)
                .padding()
            
            
            Text("We need to see your name clearly printed on the listed official documents")
                .font(.subheadline)
                .foregroundColor(.black)
                .padding(.leading)
                .multilineTextAlignment(.leading)
            
            VStack(alignment: .leading) {
                Divider()
                NavigationLink(destination: UploadDriverLicenseCardView(loanApplicationService: loanApplicationService, systemName: "camera", fileName: Document.DriverLicense, viewTitle: "Front card", side: "front side")) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(Color.white)
                        HStack {
                            VStack {
                                Text("Driver's License")
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(.black)
                                    .fixedSize()
                                    .padding(.leading)
                            }
                            Spacer()
                            Image(systemName: (loanApplicationService.DriverLicenseStepCompletedIcon != nil) ? loanApplicationService.DriverLicenseStepCompletedIcon!: "chevron.right")
                                .padding(.trailing)
                                .font(.system(size: 15))
                                .foregroundColor(Color(red: 68 / 255, green: 159 / 255, blue: 100 / 255))
                        }
                        .frame(maxWidth:.infinity, alignment: .leading)
                    }
                    .frame(height: 60)
                }
                Divider()
                NavigationLink(destination: UploadSocialSecurityCard(loanApplicationService: loanApplicationService, systemName: "camera", fileName: Document.SocialSecurityCard, viewTitle: "Front card",  side: "front side")) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(Color.white)
                        HStack {
                            VStack {
                                Text("Social Security card")
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(.black)
                                    .fixedSize()
                                    .padding(.leading)
                            }
                            Spacer()
                            Image(systemName: (loanApplicationService.SocialSecurityCardStepCompletedIcon != nil) ? loanApplicationService.SocialSecurityCardStepCompletedIcon!: "chevron.right")
                                .padding(.trailing)
                                .font(.system(size: 15))
                                .foregroundColor(Color(red: 68 / 255, green: 159 / 255, blue: 100 / 255))
                        }
                        .frame(maxWidth:.infinity, alignment: .leading)
                    }
                    .frame(height: 60)
                }
                Divider()
            }
        }
         .onAppear(perform: reset)
        .padding(.top)
        .frame(maxWidth:.infinity, alignment: .leading)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action:{print("back button hit")}) {
                    NavigationLink(destination: LoanUploadDocumentsView(loanApplicationService: loanApplicationService)) {
                        HStack {
                            Image(systemName: "chevron.backward")
                                .font(Font.system(size: 18, weight: .regular))
                            Text("Back")
                        }
                    }
                }
            }
        }
    }
    func reset() {
            loanApplicationService.uploadComplete = false
                }
    
}

struct UploadIdentityDocuments_Previews: PreviewProvider {
    static var previews: some View {
        LoanUploadIdentityDocuments(loanApplicationService: LoanApplicationService())
    }
}

