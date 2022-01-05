//
//  UploadIdentityDocuments.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 12/11/21.
//

import SwiftUI

struct LoanUploadAddressDocuments: View {
    @ObservedObject var loanApplicationService: LoanApplicationService
    var body: some View {
        VStack(alignment: .leading) {
            Image("Home")
                .resizable()
                .padding(.top)
                .padding(.leading)
                .frame(maxWidth:250, alignment: .leading)
                .frame(height: 230)
            
            Text("Proof of address")
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
                    NavigationLink(destination: UploadAddressUtilityBill(loanApplicationService: loanApplicationService)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(Color.white)
                            HStack {
                                VStack {
                                    Text("Utility Bill")
                                        .font(.title3)
                                        .bold()
                                        .foregroundColor(.black)
                                        .fixedSize()
                                        .padding(.leading)
                                }
                                Spacer()
                                Image(systemName: (loanApplicationService.UtilityBillStepCompletedIcon != nil) ? loanApplicationService.UtilityBillStepCompletedIcon!: "chevron.right")
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
}

struct UploadAddressDocuments_Previews: PreviewProvider {
    static var previews: some View {
        LoanUploadAddressDocuments(loanApplicationService: LoanApplicationService())
    }
}

