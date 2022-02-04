//
//  LoanPersonalInformationView.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 12/2/21.
//

import SwiftUI
import iPhoneNumberField

struct LoanPersonalInformationView: View {
    @ObservedObject var loanApplicationService: LoanApplicationService
    
    
    var body: some View {
        VStack {
            VStack {
                
                Text("Personal Information")
                    .font(.title)
                    .padding()
                    .padding(.bottom)
                    .foregroundColor(.white)
                
            }
            .frame(maxWidth: .infinity)
            .background(Color(red: 68 / 255, green: 159 / 255, blue: 100 / 255))
                        
            
            Form {
                    TextField("First name", text: $loanApplicationService.loanApplicationForm.firstName)
                        .padding(.vertical)
                    TextField("Last name", text: $loanApplicationService.loanApplicationForm.lastName)
                        .padding(.vertical)
                    TextField("Email", text: $loanApplicationService.loanApplicationForm.email)
                        .padding(.vertical)
                    DatePicker(
                        "Date of Birth",
                        selection: $loanApplicationService.loanApplicationForm.DOB,
                        displayedComponents: [.date]
                    )
                        .padding(.vertical)
                    iPhoneNumberField(text: $loanApplicationService.loanApplicationForm.phoneNumber)
                        .padding(.vertical)
            }
            .onAppear {
              UITableView.appearance().backgroundColor = .clear
            }
            .onDisappear {
              UITableView.appearance().backgroundColor = .systemGroupedBackground
            }
            
            VStack {
                Button(action: {}) {
                    NavigationLink(destination: LoanPersonalQuestionsView(loanApplicationService: loanApplicationService)) {
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
                .disabled(loanApplicationService.disablePersonalInformationNextBtn)
            }
            
            
        }
    }
}

struct LoanPersonalInformationView_Previews: PreviewProvider {
    static var previews: some View {
        LoanPersonalInformationView(loanApplicationService: LoanApplicationService())
    }
}
