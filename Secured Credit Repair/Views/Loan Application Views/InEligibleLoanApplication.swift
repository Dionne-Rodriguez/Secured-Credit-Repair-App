//
//  InEligibleLoanApplication.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 12/3/21.
//

import SwiftUI

struct InEligibleLoanApplication: View {
    @State private var goHome = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 75) {
            Image(systemName: "x.circle")
                .resizable()
                .frame(width: 120, height: 120, alignment: .center)
                .foregroundColor(.red)
             
            Text("We apologize you are unfortunately unable to apply for a loan at this time.")
                .padding(.horizontal)
                .foregroundColor(.red)
                .font(.title2)
                
            
            NavigationLink(destination: HomeView(showMenu: false)) {
                HStack{
                    Spacer()
                    Text("Next")
                        .font(.title3)
                        .foregroundColor(.blue)
                    Spacer()
                }
            }.buttonStyle(.bordered)
            
        }
    }
}

struct InEligibleLoanApplication_Previews: PreviewProvider {
    static var previews: some View {
        InEligibleLoanApplication()
    }
}
