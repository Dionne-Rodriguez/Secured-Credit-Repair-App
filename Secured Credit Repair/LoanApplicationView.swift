//
//  LoanApplicationView.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 11/27/21.
//

import SwiftUI
import iPhoneNumberField

struct LoanApplicationView: View {
    
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
            
            NavigationLink(destination: ContactInfo()) {
                Text("Next")
            }
            .buttonStyle(.borderedProminent)
            .frame(width: 350, alignment: .trailing)
            Spacer()
        }
    }
}


struct ContactInfo: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var phoneNumber: String = ""
    @State var SSN: String = ""
    @State var DOB = Date()
    
    var body: some View {
        VStack {
            Text("Personal Information")
                .font(.title)
                .padding(.horizontal)
            Spacer()
            Form {
                Section(header: Text("")) {
                    TextField("First name", text: $firstName)
                        .padding(.vertical)
                    TextField("Last name", text: $lastName)
                        .padding(.vertical)
                    DatePicker(
                        "Date of Birth",
                        selection: $DOB,
                        displayedComponents: [.date]
                    )
                        .padding(.vertical)
                    TextField("Social Security Number", text: $SSN)
                        .padding(.vertical)
                    iPhoneNumberField(text: $phoneNumber)
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

struct LoanDetailQuestions: View {
    @State private var didTap:Bool = false
    var body: some View {
        VStack {
            Text("Personal Information")
                .font(.title)
                .padding(.horizontal)
            Spacer()
            Form {
                Section(header: Text("")) {
                    HStack {
                        Text("Have you ever?")
                        
                        Spacer()
                        Button("Yes") {
                            self.didTap.toggle()
                        }
                        .buttonStyle(.bordered)
                        .background(didTap ? Color.blue : nil)
                        .foregroundColor(didTap ? Color.white : nil)
                        
                        Button("No") {
                            
                        }
                        .buttonStyle(.bordered)
                 
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


struct LoanApplicationView_Previews: PreviewProvider {
    static var previews: some View {
        LoanDetailQuestions()
    }
}
