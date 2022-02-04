//
//  LoanUploadDocumentsView.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 12/2/21.
//

import SwiftUI
import SwiftUINavigationBarColor

struct LoanUploadDocumentsView: View {
    @ObservedObject var loanApplicationService: LoanApplicationService
    
    var body: some View {
        ScrollView {
            VStack (spacing: 5) {
                VStack {
                    Spacer()
                    Spacer()
                    Image(systemName: "doc.badge.plus")
                        .font(.system(size: 150))
                        .padding(.vertical)
                        .foregroundColor(.white)

                    Text("You need to Upload the required Documents")
                        .foregroundColor(.white)
                        .font(.title2)
                        .bold()
                        .frame(width: 350)
                    Spacer()
                }
                .ignoresSafeArea(.container, edges: .top)
                .frame(maxWidth: .infinity)
                .frame(height: 400)
                .background(Color(red: 68 / 255, green: 159 / 255, blue: 100 / 255))


                
                NavigationLink(destination: LoanUploadIdentityDocuments(loanApplicationService: loanApplicationService)) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(Color.white)
                            .shadow(radius: 5)
                        HStack {
                            Image(systemName: "person.text.rectangle")
                                .font(.system(size: 30))
                                .padding(.horizontal)
                                .foregroundColor(.black)
                            VStack(alignment: .leading){
                                Text("Proof of identity")
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(.black)
                                    .lineLimit(1)
                                    .fixedSize()
                                
                                
                                Text("Upload driver's license, social security card...")
                                    .font(.footnote)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.leading)
                            }
                            .padding(.bottom)
                            Spacer()
                            Image(systemName: (loanApplicationService.DriverLicenseStepCompletedIcon != nil) && (loanApplicationService.SocialSecurityCardStepCompletedIcon != nil) ? loanApplicationService.SocialSecurityCardStepCompletedIcon!: "chevron.right")
                                .padding(.trailing)
                                .font(.system(size: 15))
                                .foregroundColor(Color(red: 68 / 255, green: 159 / 255, blue: 100 / 255))
                        }
                        .frame(maxWidth:.infinity, alignment: .leading)
                    }
                    .frame(height: 120)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 15)
                }
                NavigationLink(destination: LoanUploadAddressDocuments(loanApplicationService: loanApplicationService)) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(Color.white)
                            .shadow(radius: 5)
                        HStack {
                            Image(systemName: "house")
                                .font(.system(size: 30))
                                .padding(.horizontal)
                                .foregroundColor(.black)
                            VStack(alignment: .leading){
                                Text("Proof of Address")
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(.black)
                                    .fixedSize()
                                
                                Text("Upload a utility bill, bank statements, electric, cell phone, cable bill...")
                                    .font(.footnote)
                                    .foregroundColor(.black)
                                    .frame(width: 200)
                                    .multilineTextAlignment(.leading)
                            }
                            .padding(.bottom)
                            Spacer()
                            Image(systemName:  (loanApplicationService.UtilityBillStepCompletedIcon != nil) ? loanApplicationService.UtilityBillStepCompletedIcon!: "chevron.right")
                                .padding(.trailing)
                                .font(.system(size: 15))
                                .foregroundColor(Color(red: 68 / 255, green: 159 / 255, blue: 100 / 255))
                        }
                        .frame(maxWidth:.infinity, alignment: .leading)
                    }
                    .frame(height: 120)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 5)
                }
                
                NavigationLink(destination: LoanUploadIncomeDocuments(loanApplicationService: loanApplicationService)) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(Color.white)
                            .shadow(radius: 5)
                        HStack {
                            Image(systemName: "dollarsign.square")
                                .font(.system(size: 30))
                                .padding(.horizontal)
                                .foregroundColor(.black)
                            VStack(alignment: .leading){
                                Text("Proof of Income")
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(.black)
                                    .fixedSize()
                                
                                
                                Text("Upload W2, paystubs, bank statements")
                                    .font(.footnote)
                                    .foregroundColor(.black)
                                
                                    .multilineTextAlignment(.leading)
                            }
                            .padding(.bottom)
                            Spacer()
                            Image(systemName: (loanApplicationService.W2StepCompletedIcon != nil) && (loanApplicationService.PayStubStepCompletedIcon != nil) && (loanApplicationService.BankStatementsCompletedIcon != nil) ? loanApplicationService.W2StepCompletedIcon!: "chevron.right")
                                .padding(.trailing)
                                .font(.system(size: 15))
                                .foregroundColor(Color(red: 68 / 255, green: 159 / 255, blue: 100 / 255))
                        }
                        .frame(maxWidth:.infinity, alignment: .leading)
                    }
                    .frame(height: 120)
                    .padding(.horizontal, 15)
                    .padding(.top, 15)
                }
                
                NavigationLink(destination: LoanApplicationComplete(loanApplicationService: loanApplicationService), isActive: $loanApplicationService.applicationComplete) {EmptyView()}
                
                Button(action:{loanApplicationService.submitApplication()}) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(Color(red: 68 / 255, green: 159 / 255, blue: 100 / 255))
                            Text("Submit Application")
                            .font(.system(size: 21))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .frame(maxWidth:.infinity, alignment: .center)
                    }
                    .frame(height: loanApplicationService.showSubmitApplicationBtn ? 70 : 0)
                    .padding(.horizontal, 15)
                    .padding(.vertical, loanApplicationService.showSubmitApplicationBtn ? 15 : 0)
                
                }
            }
        }
        .ignoresSafeArea(.container, edges: .top)
     
    }
    func onCompletion() {
        print("completed")
    }
    
    
}

struct LoanUploadDocumentsView_Previews: PreviewProvider {
    static var previews: some View {
        LoanUploadDocumentsView(loanApplicationService: LoanApplicationService())
    }
}
