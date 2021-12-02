//
//  LoanApplicationView.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 11/27/21.
//

import SwiftUI
import iPhoneNumberField

 


struct LoanApplicationView: View {
    
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
            Text("Loan Application")
                .font(.title)
                .padding(.horizontal)
            
            Spacer()
            
            Text("How much would you like to borrow?")
                .font(.title2)
                .padding(.horizontal)
            Slider(
                value: $speed,
                in: 1000...50000,
                step: 500,
                onEditingChanged: { editing in
                    isEditing = editing
                }
            )
                .padding(.horizontal)
            
            
            Text(totalLoanAmount)
            
            
            NavigationLink(destination: ContactInfo(loanApplicationService: loanApplicationService)) {
                Text("Next")
            }.simultaneousGesture(TapGesture().onEnded{
                loanApplicationService.loanApplicationForm.requestLoanAmount = totalLoanAmount
                print(loanApplicationService.loanApplicationForm)
            })
            .buttonStyle(.borderedProminent)
            .frame(width: 350, alignment: .trailing)
            Spacer()
        }
    }
}


struct ContactInfo: View {
    
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
                    Button("Tap here"){
                        print(loanApplicationService.loanApplicationForm)
                    }
                }
                
                NavigationLink(destination: LoanDetailQuestions()) {
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
}

struct LoanDetailQuestions: View {
    @State private var didTapYesUSCitizen:Bool = false
    @State private var didTapNoUSCitizen:Bool = false
    
    @State private var didTapYesCreditScore:Bool = false
    @State private var didTapNoCreditScore:Bool = false
    
    @State private var didTapYesAnnualIncome:Bool = false
    @State private var didTapNoAnnualIncome:Bool = false
    
    @State private var didTapYesInquiries:Bool = false
    @State private var didTapNoInquiries:Bool = false
    
    @State private var didTapYesNewCreditLines:Bool = false
    @State private var didTapNoNewCreditLines:Bool = false
    
    @State private var didTapYesBankruptcy:Bool = false
    @State private var didTapNoBankruptcy:Bool = false
    
    @State private var didTapYesDerogatoryReport:Bool = false
    @State private var didTapNoDerogatoryReport:Bool = false
    
    @State private var didTapYesCreditCardBalance:Bool = false
    @State private var didTapNoCreditCardBalance:Bool = false
    
    @State private var showFullScreen = false
    @State private var showAlert = false
    @State private var goHome = false
    
    
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
                        
                        ZStack{
                            
                            
                            NavigationLink(destination: ContentView(), isActive: self.$goHome)
                            { EmptyView() }
                        }.hidden()
                        
                        Button("Yes") {
                            if(self.didTapNoUSCitizen) {
                                self.didTapNoUSCitizen = false
                            }
                            self.didTapYesUSCitizen.toggle()
                        }
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.roundedRectangle)
                        .background(didTapYesUSCitizen ? Color.blue : nil)
                        .foregroundColor(didTapYesUSCitizen ? Color.white : nil)
                        
                        Button("No") {
                            if(self.didTapYesUSCitizen){
                                self.didTapYesUSCitizen = false
                            }
                            self.didTapNoUSCitizen.toggle()
                        }
                        
                        .buttonStyle(.bordered)
                        .background(didTapNoUSCitizen ? Color.blue : nil)
                        .foregroundColor(didTapNoUSCitizen ? Color.white : nil)
                    }
                    .padding(.vertical)
                    
                    HStack {
                        Text("Is your Credit Score 660 or Higher?")
                        
                        Spacer()
                        
                        Button("Yes") {
                            if(self.didTapNoCreditScore){
                                self.didTapNoCreditScore = false
                            }
                            self.didTapYesCreditScore.toggle()
                        }
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.roundedRectangle)
                        .background(didTapYesCreditScore ? Color.blue : nil)
                        .foregroundColor(didTapYesCreditScore ? Color.white : nil)
                        
                        Button("No") {
                            if(self.didTapYesCreditScore){
                                self.didTapYesCreditScore = false
                            }
                            self.didTapNoCreditScore.toggle()
                        }
                        .buttonStyle(.bordered)
                        .background(didTapNoCreditScore ? Color.blue : nil)
                        .foregroundColor(didTapNoCreditScore ? Color.white : nil)
                        
                    }
                    .padding(.vertical)
                    
                    HStack {
                        Text("Is your annual income more than $30,000?")
                        
                        Spacer()
                        
                        ZStack {
                            
                            NavigationLink(destination: ContentView(), isActive: self.$goHome)
                            { EmptyView() }
                        }.hidden()
                        
                        Button("Yes") {
                            if(self.didTapNoAnnualIncome){
                                self.didTapNoAnnualIncome = false
                            }
                            self.didTapYesAnnualIncome.toggle()
                        }
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.roundedRectangle)
                        .background(didTapYesAnnualIncome ? Color.blue : nil)
                        .foregroundColor(didTapYesAnnualIncome ? Color.white : nil)
                        
                        Button("No") {
                            if(self.didTapYesAnnualIncome){
                                self.didTapYesAnnualIncome = false
                            }
                            self.didTapNoAnnualIncome.toggle()
                            showFullScreen = true
                        }
                        .buttonStyle(.bordered)
                        .background(didTapNoAnnualIncome ? Color.blue : nil)
                        .foregroundColor(didTapNoAnnualIncome ? Color.white : nil)
                        
                        
                    }
                    .padding(.vertical)
                    
                    HStack {
                        Text("Do you have less than 6 inquiries in the last 6 months?")
                        
                        Spacer()
                        
                        Button("Yes") {
                            if(self.didTapNoInquiries){
                                self.didTapNoInquiries = false
                            }
                            self.didTapYesInquiries.toggle()
                        }
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.roundedRectangle)
                        .background(didTapYesInquiries ? Color.blue : nil)
                        .foregroundColor(didTapYesInquiries ? Color.white : nil)
                        
                        Button("No") {
                            if(self.didTapYesInquiries){
                                self.didTapYesInquiries = false
                            }
                            self.didTapNoInquiries.toggle()
                        }
                        .buttonStyle(.bordered)
                        .background(didTapNoInquiries ? Color.blue : nil)
                        .foregroundColor(didTapNoInquiries ? Color.white : nil)
                        
                    }
                    .padding(.vertical)
                    
                    HStack {
                        Text("Do you have new credit lines opened in the last 6 months (Credit Cards, Limit Increases, Car Loan, Mortgage, personal loans or etc?")
                        
                        Spacer()
                        
                        Button("Yes") {
                            if(self.didTapNoNewCreditLines){
                                self.didTapNoNewCreditLines = false
                            }
                            self.didTapYesNewCreditLines.toggle()
                        }
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.roundedRectangle)
                        .background(didTapYesNewCreditLines ? Color.blue : nil)
                        .foregroundColor(didTapYesNewCreditLines ? Color.white : nil)
                        
                        Button("No") {
                            if(self.didTapYesNewCreditLines){
                                self.didTapYesNewCreditLines = false
                            }
                            self.didTapNoNewCreditLines.toggle()
                        }
                        .buttonStyle(.bordered)
                        .background(didTapNoNewCreditLines ? Color.blue : nil)
                        .foregroundColor(didTapNoNewCreditLines ? Color.white : nil)
                        
                    }
                    .padding(.vertical)
                    
                    HStack {
                        Text("Have you ever filed Bankruptcy?")
                        
                        Spacer()
                        
                        Button("Yes") {
                            if(self.didTapNoBankruptcy){
                                self.didTapNoBankruptcy = false
                            }
                            self.didTapYesBankruptcy.toggle()
                        }
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.roundedRectangle)
                        .background(didTapYesBankruptcy ? Color.blue : nil)
                        .foregroundColor(didTapYesBankruptcy ? Color.white : nil)
                        
                        Button("No") {
                            if(self.didTapYesBankruptcy){
                                self.didTapYesBankruptcy = false
                            }
                            self.didTapNoBankruptcy.toggle()
                        }
                        .buttonStyle(.bordered)
                        .background(didTapNoBankruptcy ? Color.blue : nil)
                        .foregroundColor(didTapNoBankruptcy ? Color.white : nil)
                        
                    }
                    .padding(.vertical)
                    
                    HStack {
                        Text("Do you have any late payments, recent collections, or anything that is derogatory reporting in the last 2 years?")
                        
                        Spacer()
                        
                        Button("Yes") {
                            if(self.didTapNoDerogatoryReport){
                                self.didTapNoDerogatoryReport = false
                            }
                            self.didTapYesDerogatoryReport.toggle()
                        }
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.roundedRectangle)
                        .background(didTapYesDerogatoryReport ? Color.blue : nil)
                        .foregroundColor(didTapYesDerogatoryReport ? Color.white : nil)
                        
                        Button("No") {
                            if(self.didTapYesDerogatoryReport){
                                self.didTapYesDerogatoryReport = false
                            }
                            self.didTapNoDerogatoryReport.toggle()
                        }
                        .buttonStyle(.bordered)
                        .background(didTapNoDerogatoryReport ? Color.blue : nil)
                        .foregroundColor(didTapNoDerogatoryReport ? Color.white : nil)
                        
                    }
                    .padding(.vertical)
                    
                    HStack {
                        Text("Do you have at least 50% left on vour current credit card balances?")
                        
                        Spacer()
                        
                        Button("Yes") {
                            if(self.didTapNoCreditCardBalance){
                                self.didTapNoCreditCardBalance = false
                            }
                            self.didTapYesCreditCardBalance.toggle()
                        }
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.roundedRectangle)
                        .background(didTapYesCreditCardBalance ? Color.blue : nil)
                        .foregroundColor(didTapYesCreditCardBalance ? Color.white : nil)
                        
                        Button("No") {
                            if(self.didTapYesCreditCardBalance){
                                self.didTapYesCreditCardBalance = false
                            }
                            self.didTapNoCreditCardBalance.toggle()
                        }
                        .buttonStyle(.bordered)
                        .background(didTapNoCreditCardBalance ? Color.blue : nil)
                        .foregroundColor(didTapNoCreditCardBalance ? Color.white : nil)
                        
                    }
                    .padding(.vertical)
                    
                }
                
                
                NavigationLink(destination: LoanDetailQuestions()) {
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
}



struct LoanApplicationView_Previews: PreviewProvider {
    static var previews: some View {
        LoanDetailQuestions()
    }
}





func isEligible(questionResponse:Bool) {
    print("Func call from button action \(questionResponse)")
    if(questionResponse) {
        return
    }
}
