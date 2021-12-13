//
//  UploadIdentityDocuments.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 12/11/21.
//

import SwiftUI

struct LoanUploadIdentityDocuments: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("ID-Card")
                .padding(.top)
                .padding(.leading)
//                .frame(maxWidth:230, alignment: .leading)
//                .frame(height: 230)
            
            
            Text("Proof of identity")
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

struct UploadIdentityDocuments_Previews: PreviewProvider {
    static var previews: some View {
        LoanUploadIdentityDocuments()
    }
}

