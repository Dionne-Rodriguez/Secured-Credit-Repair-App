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
            Text("Personal Information")
                .font(.title)
                .padding(.horizontal)
            Spacer()
            Form {
                Section(header: Text("")) {
                    TextField("First name", text: $loanApplicationService.loanApplicationForm.firstName)
                        .padding(.vertical)
                    TextField("Last name", text: $loanApplicationService.loanApplicationForm.lastName)
                        .padding(.vertical)
                    DatePicker(
                        "Date of Birth",
                        selection: $loanApplicationService.loanApplicationForm.DOB,
                        displayedComponents: [.date]
                    )
                        .padding(.vertical)
                    TextField("Social Security Number", text: $loanApplicationService.loanApplicationForm.SSN)
                        .padding(.vertical)
                    iPhoneNumberField(text: $loanApplicationService.loanApplicationForm.phoneNumber)
                        .padding(.vertical)
                }
                
                NavigationLink(destination: LoanPersonalQuestionsView(loanApplicationService: loanApplicationService)) {
                    HStack{
                        Spacer()
                        Text("Next")
                            .foregroundColor(.blue)
                        Spacer()
                    }
                }
                .disabled(loanApplicationService.disablePersonalInformationNextBtn)
            }
        }
    }
}

struct LoanPersonalInformationView_Previews: PreviewProvider {
    static var previews: some View {
        LoanPersonalInformationView(loanApplicationService: LoanApplicationService()).preferredColorScheme(.dark)
    }
}
