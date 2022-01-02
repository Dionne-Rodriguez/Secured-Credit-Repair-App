//
//  UploadIdentityDocuments.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 12/11/21.
//

import SwiftUI

struct LoanUploadApplicationForm: View {
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: "icloud.and.arrow.down")
                .font(.system(size: 150))
                .padding(.vertical)
              
            
            Text("Loan Application Form")
                .bold()
                .font(.title)
                .padding()
            
            
            Text("We need you to copy these documents links and print them out by pasting them in your browser,afterwards upload the documents when completed hit the continue button to scan the documents")
                .font(.subheadline)
                .foregroundColor(.black)
                .padding(.leading)
                .multilineTextAlignment(.leading)
            
            List {
                Link("Contract-Agreement", destination: URL(string: "https://firebasestorage.googleapis.com/v0/b/dope-deals-gateway.appspot.com/o/application-form%2FClient-agreement.pdf?alt=media&token=2f5875e7-7643-4c2f-9213-ef8034937c8f")!)
                
                Link("4506-T Form", destination: URL(string: "https://firebasestorage.googleapis.com/v0/b/dope-deals-gateway.appspot.com/o/application-form%2Ftax-return-transcript.pdf?alt=media&token=6ccd45d3-7810-40e3-bb9d-3c9b7a9035a6")!)

            }
            Spacer()
      
            Button(action:{}) {
                NavigationLink(destination: LoanScanApplicationForms(viewModel: ContentViewModel())) {
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
        }
        .padding(.top)
        .frame(maxWidth:.infinity, alignment: .leading)
    }
}

struct LoanUploadApplicationForm_Previews: PreviewProvider {
    static var previews: some View {
        LoanUploadApplicationForm()
    }
}

