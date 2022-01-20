//
//  LoanUploadIncomeDocuments.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 12/12/21.
//

import SwiftUI

struct LoanUploadIncomeDocuments: View {
    @ObservedObject var loanApplicationService: LoanApplicationService
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "dollarsign.circle")
                .resizable()
                .foregroundColor(Color(red: 40 / 255, green: 55 / 255, blue: 99 / 255))
                .padding(.top)
                .padding(.leading)
                .frame(maxWidth:250, alignment: .leading)
                .frame(height: 230)
            
            Text("Proof of income")
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
                NavigationLink(destination: UploadW2(loanApplicationService: loanApplicationService)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(Color.white)
                            HStack {
                                VStack {
                                    Text("W2")
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
                NavigationLink(destination: UploadPayStubs(loanApplicationService: loanApplicationService)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(Color.white)
                            HStack {
                                VStack {
                                    Text("One month worth of paystubs")
                                        .font(.title3)
                                        .bold()
                                        .foregroundColor(.black)
                                        .fixedSize()
                                        .padding(.leading)
                                }
                                Spacer()
                                Image(systemName: (loanApplicationService.PayStubStepCompletedIcon != nil) ? loanApplicationService.PayStubStepCompletedIcon!: "chevron.right")
                                    .padding(.trailing)
                                    .font(.system(size: 15))
                                    .foregroundColor(Color(red: 68 / 255, green: 159 / 255, blue: 100 / 255))
                            }
                            .frame(maxWidth:.infinity, alignment: .leading)
                        }
                        .frame(height: 60)
                    }
                Divider()
                NavigationLink(destination: UploadBankStatements(loanApplicationService: loanApplicationService)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(Color.white)
                            HStack {
                                VStack {
                                    Text("Three month's of bank statements")
                                        .font(.title3)
                                        .bold()
                                        .foregroundColor(.black)
                                        .fixedSize()
                                        .padding(.leading)
                                        
                                }
                                Spacer()
                                Image(systemName: (loanApplicationService.BankStatementsCompletedIcon != nil) ? loanApplicationService.BankStatementsCompletedIcon!: "chevron.right")
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
//        .onAppear(perform: reset)
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

struct LoanUploadIncomeDocuments_Previews: PreviewProvider {
    static var previews: some View {
        LoanUploadIncomeDocuments(loanApplicationService: LoanApplicationService())
    }
}

//
//NavigationLink(destination: UploadPayStubs(loanApplicationService: loanApplicationService)) {
//    ZStack {
//        RoundedRectangle(cornerRadius: 10, style: .continuous)
//            .fill(Color.white)
//        HStack {
//            VStack {
//                Text("One month worth of paystubs")
//                    .font(.title3)
//                    .bold()
//                    .foregroundColor(.black)
//                    .fixedSize()
//                    .padding(.leading)
//            }
//            Spacer()
//            Image(systemName: (loanApplicationService.PayStubStepCompletedIcon != nil) ? loanApplicationService.PayStubStepCompletedIcon!: "chevron.right")
//                .padding(.trailing)
//                .font(.system(size: 15))
//                .foregroundColor(Color(red: 68 / 255, green: 159 / 255, blue: 100 / 255))
//        }
//        .frame(maxWidth:.infinity, alignment: .leading)
//    }
//    .frame(height: 60)
//}
//Divider()
//NavigationLink(destination: UploadBankStatements(loanApplicationService: loanApplicationService)) {
//    ZStack {
//        RoundedRectangle(cornerRadius: 10, style: .continuous)
//            .fill(Color.white)
//        HStack {
//            VStack {
//                Text("Three month's worth of bank statements")
//                    .font(.title3)
//                    .bold()
//                    .foregroundColor(.black)
//                    .fixedSize()
//                    .padding(.leading)
//            }
//            Spacer()
//            Image(systemName: (loanApplicationService.BankStatementsCompletedIcon != nil) ? loanApplicationService.BankStatementsCompletedIcon!: "chevron.right")
//                .padding(.trailing)
//                .font(.system(size: 15))
//                .foregroundColor(Color(red: 68 / 255, green: 159 / 255, blue: 100 / 255))
//        }
//        .frame(maxWidth:.infinity, alignment: .leading)
//    }
//    .frame(height: 60)
//}
