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
                    NavigationLink(destination: UploadDriverLisenceCardView(loanApplicationService: loanApplicationService, systemName: "camera", fileName: Document.DriverLisence, viewTitle: "Front card", side: "front side")) {
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
                                Image(systemName: (loanApplicationService.driverLicenseStepCompletedIcon != nil) ? loanApplicationService.driverLicenseStepCompletedIcon!: "chevron.right")
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
                            Image(systemName: (loanApplicationService.socialSecurityCardStepCompletedIcon != nil) ? loanApplicationService.socialSecurityCardStepCompletedIcon!: "chevron.right")
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
        .padding(.top)
        .frame(maxWidth:.infinity, alignment: .leading)
    }
}

struct UploadIdentityDocuments_Previews: PreviewProvider {
    static var previews: some View {
        LoanUploadIdentityDocuments(loanApplicationService: LoanApplicationService())
    }
}

