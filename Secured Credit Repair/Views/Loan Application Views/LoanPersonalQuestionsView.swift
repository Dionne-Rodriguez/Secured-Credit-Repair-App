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
            VStack {
                
                Text("Personal Questions")
                    .font(.title)
                    .padding()
                    .padding(.bottom)
                    .foregroundColor(.white)
                
            }
            .frame(maxWidth: .infinity)
            .background(Color(red: 68 / 255, green: 159 / 255, blue: 100 / 255))
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
                        Text("Is your annual income more than $27,000?")
                        
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
                        .onReceive([self.$loanApplicationService.loanApplicationForm.Inquiries].publisher) { value in
                            self.presentIneligibleSheet()
                         }
                        .fullScreenCover(isPresented: $showFullScreen, content:{
                            InEligibleLoanApplication()
                        })
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
                        .onReceive([self.$loanApplicationService.loanApplicationForm.Bankruptcy].publisher) { value in
                            self.presentIneligibleSheet()
                         }
                        .fullScreenCover(isPresented: $showFullScreen, content:{
                            InEligibleLoanApplication()
                        })
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
                        .onReceive([self.$loanApplicationService.loanApplicationForm.DerogatoryReport].publisher) { value in
                            self.presentIneligibleSheet()
                         }
                        .fullScreenCover(isPresented: $showFullScreen, content:{
                            InEligibleLoanApplication()
                        })
                         
                    }
                    .padding(.vertical)
                }
            }
            .onAppear {
                UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color(red: 68 / 255, green: 159 / 255, blue: 100 / 255))
              UITableView.appearance().backgroundColor = .clear
            }
            .onDisappear {
              UITableView.appearance().backgroundColor = .systemGroupedBackground
            }
            VStack {
                Button(action: {}) {
                    NavigationLink(destination: LoanUploadDocumentsView(loanApplicationService: loanApplicationService)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(Color(red: 68 / 255, green: 159 / 255, blue: 100 / 255))
                            Text("Next")
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
                }
                .padding(.top, 20)
            }
        }
    }
    func presentIneligibleSheet() {
        if(loanApplicationService.loanApplicationForm.USCitizen == "No" || loanApplicationService.loanApplicationForm.AnnualIncome == "No" || loanApplicationService.loanApplicationForm.CreditScore == "No" || loanApplicationService.loanApplicationForm.Inquiries == "No" || loanApplicationService.loanApplicationForm.Bankruptcy == "Yes" || loanApplicationService.loanApplicationForm.DerogatoryReport == "Yes") {
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
