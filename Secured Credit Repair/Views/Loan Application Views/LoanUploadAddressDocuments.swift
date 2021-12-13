//
//  UploadIdentityDocuments.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 12/11/21.
//

import SwiftUI

struct LoanUploadAddressDocuments: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("Home")
                .resizable()
                .padding(.top)
                .padding(.leading)
                .frame(maxWidth:250, alignment: .leading)
                .frame(height: 230)
            
            Text("Proof of address")
                .bold()
                .font(.title)
                .padding()
            
            
            Text("We need to see your name clearly printed on the listed official documents")
                .font(.subheadline)
                .foregroundColor(.black)
                .padding(.leading)
                .multilineTextAlignment(.leading)
            Spacer()
            
            VStack(alignment: .leading) {
                List {
                    NavigationLink(destination: HomeView()) {
                        Text("Driver's License")
                            .padding()
                    }
                    NavigationLink(destination: HomeView()) {
                        Text("Social Security card")
                            .padding()
                    }
                }
                .listStyle(.plain)
            }
        }
        .padding(.top)
        .frame(maxWidth:.infinity, alignment: .leading)
    }
}

struct UploadAddressDocuments_Previews: PreviewProvider {
    static var previews: some View {
        LoanUploadAddressDocuments()
    }
}

