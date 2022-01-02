//
//  LoanPersonalQuestionsView.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 12/2/21.
//

import SwiftUI

struct LoanPersonalQuestionsView: View {
    @ObservedObject var loanApplicationService: LoanApplicationService
    @State private var showFullScreen = false
    
    
    
    var body: some View {
        VStack {
            Text("Personal Information")
                .font(.title)
                .padding(.horizontal)
            Spacer()
            Form {
                Section(header: Text("")) {
                    HStack {
                        Text("Are you a US Citizen?")
                        
                        Spacer()
                        Picker("", selection: $loanApplicationService.loanApplicationForm.USCitizen ) {
                            Text("Yes").tag("Yes")
                            Text("No").tag("No")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .frame(width: 120, height: 0)
                        .onReceive([self.$loanApplicationService.loanApplicationForm.USCitizen].publisher) { value in
                            self.presentIneligibleSheet()
                         }
                        .fullScreenCover(isPresented: $showFullScreen, content:{
                            InEligibleLoanApplication()
                        })
                    }
                    .padding(.vertical)
                    
                    HStack {
                        Text("Is your Credit Score 650 or Higher?")
                        
                        Spacer()
                             
                        Picker("", selection: $loanApplicationService.loanApplicationForm.CreditScore ) {
                            Text("Yes").tag("Yes")
                            Text("No").tag("No")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .frame(width: 120, height: 0)
                    }
                    .padding(.vertical)
                   
                    
                    HStack {
                        Text("Is your annual income more than $30,000?")
                        
                        Spacer()
                        
                        Picker("", selection: $loanApplicationService.loanApplicationForm.AnnualIncome ) {
                            Text("Yes").tag("Yes")
                            Text("No").tag("No")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .frame(width: 120, height: 0)
                        .onReceive([self.$loanApplicationService.loanApplicationForm.AnnualIncome].publisher) { value in
                            self.presentIneligibleSheet()
                         }
                        .fullScreenCover(isPresented: $showFullScreen, content:{
                            InEligibleLoanApplication()
                        })
                    }
                    .padding(.vertical)
                    
                    HStack {
                        Text("Do you have less than 6 inquiries in the last 6 months?")
                        
                        Spacer()
                        
                        Picker("", selection: $loanApplicationService.loanApplicationForm.Inquiries ) {
                            Text("Yes").tag("Yes")
                            Text("No").tag("No")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .frame(width: 120, height: 0)
                    }
                    .padding(.vertical)
                    
                    HStack {
                        Text("Do you have new credit lines opened in the last 6 months (Credit Cards, Limit Increases, Car Loan, Mortgage, personal loans or etc?")
                        
                        Spacer()
                        
                        Picker("", selection: $loanApplicationService.loanApplicationForm.NewCreditLines) {
                            Text("Yes").tag("Yes")
                            Text("No").tag("No")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .frame(width: 120, height: 0)
                        
                    }
                    .padding(.vertical)
                    
                    HStack {
                        Text("Have you ever filed Bankruptcy?")
                        
                        Spacer()
                        
                        Picker("", selection: $loanApplicationService.loanApplicationForm.Bankruptcy ) {
                            Text("Yes").tag("Yes")
                            Text("No").tag("No")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .frame(width: 120, height: 0)
                    }
                    .padding(.vertical)
                    
                    HStack {
                        Text("Do you have any late payments, recent collections, or anything that is derogatory reporting in the last 2 years?")
                            
                            
                        
                        Spacer()
                        
                        Picker("", selection: $loanApplicationService.loanApplicationForm.DerogatoryReport ) {
                            Text("Yes").tag("Yes")
                            Text("No").tag("No")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .frame(width: 120, height: 0)
                         
                    }
                    .padding(.vertical)
                    
                    HStack {
                        Text("Do you have at least 50% left on vour current credit card balances?")
                        
                        Spacer()
                        
                        Picker("", selection: $loanApplicationService.loanApplicationForm.CreditCardBalance ) {
                            Text("Yes").tag("Yes")
                            Text("No").tag("No")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .frame(width: 120, height: 0)
                    }
                    .padding(.vertical)
                    
                }
                
                
                NavigationLink(destination: LoanUploadDocumentsView(loanApplicationService: loanApplicationService)) {
                    HStack{
                        Spacer()
                        Text("Next")
                            .foregroundColor(.blue)
                        Spacer()
                    }
                    
                }
            }
        }
    }
    func presentIneligibleSheet() {
        if(loanApplicationService.loanApplicationForm.USCitizen == "No" || loanApplicationService.loanApplicationForm.AnnualIncome == "No") {
            self.showFullScreen = true
        } else {
            
        }
    }
    
}

struct LoanPersonalQuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        LoanPersonalQuestionsView(loanApplicationService: LoanApplicationService())
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}
