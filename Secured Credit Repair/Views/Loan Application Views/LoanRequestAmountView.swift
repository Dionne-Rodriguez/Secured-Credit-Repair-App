//
//  LoanRequestAmountView.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 12/2/21.
//

import SwiftUI

struct LoanRequestAmountView: View {
    
    @ObservedObject var loanApplicationService: LoanApplicationService
    @State private var speed: Double = 0
    @State private var isEditing = false
    var totalLoanAmount: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        let total = Double(speed)
        return numberFormatter.string(from: NSNumber(value: total)) ?? "$0"
    }
  
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                Text("How much would you like to borrow?")
                    .font(.title)
                    .padding()
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(Color(red: 68 / 255, green: 159 / 255, blue: 100 / 255))
            .ignoresSafeArea(.container, edges: .top)
            
            VStack {
                Slider(
                    value: $speed,
                    in: 1000...50000,
                    step: 500,
                    onEditingChanged: { editing in
                        isEditing = editing
                        loanApplicationService.loanApplicationForm.requestLoanAmount = totalLoanAmount
                    }
                )
                    .padding()
                
                Text(totalLoanAmount)
                    .padding()
                    .font(.largeTitle)
                
                Spacer()
               
                
                NavigationLink(destination: LoanPersonalInformationView(loanApplicationService: loanApplicationService)) {
                    Text("Next")
                }
                .buttonStyle(.borderedProminent)
                .frame(width: 350, alignment: .trailing)
                .disabled(loanApplicationService.disableLoanAmountBtn)
                
                Spacer()
            }
        }
        
    }
    
}

struct LoanRequestAmountView_Previews: PreviewProvider {

    static var previews: some View {
        LoanRequestAmountView(loanApplicationService: LoanApplicationService())
    }
}
