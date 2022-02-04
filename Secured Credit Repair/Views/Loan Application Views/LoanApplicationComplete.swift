//
//  LoanApplicationComplete.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 1/2/22.
//

import SwiftUI

struct LoanApplicationComplete: View {
    @ObservedObject var loanApplicationService: LoanApplicationService
    
    
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    
                    
                    Text("Loan Application Submitted!")
                        .multilineTextAlignment(.center)
                        .padding()
                    Text("Thank you...Response time is within 24-72 hours")
                        .multilineTextAlignment(.center)
                        .padding()
                    
                }
                .padding(.bottom, 100)
                
                VStack {
                    Spacer()
                    
                    Button(action: {}) {
                        NavigationLink(destination: HomeView()) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(Color(red: 68 / 255, green: 159 / 255, blue: 100 / 255))
                                Text("Continue")
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
        .navigationBarBackButtonHidden(true)
    }
    
    
}

struct LoanApplicationComplete_Previews: PreviewProvider {
    static var previews: some View {
        LoanApplicationComplete(loanApplicationService: LoanApplicationService())
    }
}
