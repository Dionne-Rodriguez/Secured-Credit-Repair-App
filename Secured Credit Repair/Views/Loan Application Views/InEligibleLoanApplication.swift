//
//  InEligibleLoanApplication.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 12/3/21.
//

import SwiftUI

struct InEligibleLoanApplication: View {
    @State private var goHome : Int? = nil
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 75) {
                Image(systemName: "x.circle")
                    .resizable()
                    .frame(width: 75, height: 75, alignment: .center)
                    .foregroundColor(.red)
                
                Text("We apologize you are unfortunately unable to apply for a loan at this time.")
                    .padding(.horizontal)
                    .foregroundColor(.red)
                    .font(.title2)
                
                NavigationLink(destination: HomeView(), tag: 1, selection: $goHome) {
                  Button(action: {
                    goHome = 1
                 }) {
                     HStack{
                         Spacer()
                         Text("Next")
                             .foregroundColor(.blue)
                             .frame(height: 30)
                         Spacer()
                     }
                 }
                 .buttonStyle(.bordered)
                             }
                Spacer()
            }
        }
    }
}


struct InEligibleLoanApplication_Previews: PreviewProvider {
    static var previews: some View {
        InEligibleLoanApplication()
    }
}
