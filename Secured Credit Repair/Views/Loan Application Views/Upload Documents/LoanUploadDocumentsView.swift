//
//  LoanUploadDocumentsView.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 12/2/21.
//

import SwiftUI
import SwiftUINavigationBarColor

struct LoanUploadDocumentsView: View {
    @State var submissionComplete: Bool = false
    @ObservedObject var loanApplicationService: LoanApplicationService
    
    var body: some View {
        ScrollView {
            VStack (spacing: 5) {
                VStack {
                    Spacer()
                    Image(systemName: "doc.badge.plus")
                        .font(.system(size: 150))
                        .padding(.vertical)
                        .foregroundColor(.white)
                    Spacer()
                    Text("You need to Upload the required Documents")
                        .foregroundColor(.white)
                        .font(.title2)
                        .bold()
                        .frame(width: 350)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 400)
                .background(Color(red: 68 / 255, green: 159 / 255, blue: 100 / 255))
                .ignoresSafeArea(.container, edges: .top)
                
                
                NavigationLink(destination: LoanUploadApplicationForm(loanApplicationService: loanApplicationService)) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(Color.white)
                            .shadow(radius: 5)
                        HStack {
                            Image(systemName: "doc.plaintext")
                                .font(.system(size: 30))
                                .padding(.horizontal)
                                .foregroundColor(.black)
                            VStack(alignment: .leading){
                                Text("Application Form")
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(.black)
                                    .lineLimit(1)
                                    .fixedSize()
                                
                                
                                Text("Download an application form...")
                                    .font(.footnote)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.leading)
                            }
                            .padding(.bottom)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .padding(.trailing)
                                .font(.system(size: 15))
                                .foregroundColor(Color(red: 68 / 255, green: 159 / 255, blue: 100 / 255))
                        }
                        .frame(maxWidth:.infinity, alignment: .leading)
                    }
                    .frame(height: 120)
                    .padding(.horizontal, 15)
                    .padding(.top, 15)
                }
                .navigationTitle("back")
                
                NavigationLink(destination: LoanUploadIdentityDocuments(loanApplicationService: loanApplicationService)) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(Color.white)
                            .shadow(radius: 5)
                        HStack {
                            Image(systemName: "person.text.rectangle")
                                .font(.system(size: 30))
                                .padding(.horizontal)
                                .foregroundColor(.black)
                            VStack(alignment: .leading){
                                Text("Proof of identity")
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(.black)
                                    .lineLimit(1)
                                    .fixedSize()
                                
                                
                                Text("Upload driver's license, social security card...")
                                    .font(.footnote)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.leading)
                            }
                            .padding(.bottom)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .padding(.trailing)
                                .font(.system(size: 15))
                                .foregroundColor(Color(red: 68 / 255, green: 159 / 255, blue: 100 / 255))
                        }
                        .frame(maxWidth:.infinity, alignment: .leading)
                    }
                    .frame(height: 120)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 15)
                }
                .navigationTitle("back")
                NavigationLink(destination: LoanUploadAddressDocuments(loanApplicationService: loanApplicationService)) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(Color.white)
                            .shadow(radius: 5)
                        HStack {
                            Image(systemName: "house")
                                .font(.system(size: 30))
                                .padding(.horizontal)
                                .foregroundColor(.black)
                            VStack(alignment: .leading){
                                Text("Proof of Address")
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(.black)
                                    .fixedSize()
                                
                                Text("Upload a utility bill, bank statements, electric, cell phone, cable bill...")
                                    .font(.footnote)
                                    .foregroundColor(.black)
                                    .frame(width: 200)
                                    .multilineTextAlignment(.leading)
                            }
                            .padding(.bottom)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .padding(.trailing)
                                .font(.system(size: 15))
                                .foregroundColor(Color(red: 68 / 255, green: 159 / 255, blue: 100 / 255))
                        }
                        .frame(maxWidth:.infinity, alignment: .leading)
                    }
                    .frame(height: 120)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 5)
                }
                
                NavigationLink(destination: LoanUploadIncomeDocuments(loanApplicationService: loanApplicationService)) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(Color.white)
                            .shadow(radius: 5)
                        HStack {
                            Image(systemName: "dollarsign.square")
                                .font(.system(size: 30))
                                .padding(.horizontal)
                                .foregroundColor(.black)
                            VStack(alignment: .leading){
                                Text("Proof of Income")
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(.black)
                                    .fixedSize()
                                
                                
                                Text("Upload W2, paystubs, bank statements")
                                    .font(.footnote)
                                    .foregroundColor(.black)
                                
                                    .multilineTextAlignment(.leading)
                            }
                            .padding(.bottom)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .padding(.trailing)
                                .font(.system(size: 15))
                                .foregroundColor(Color(red: 68 / 255, green: 159 / 255, blue: 100 / 255))
                        }
                        .frame(maxWidth:.infinity, alignment: .leading)
                    }
                    .frame(height: 120)
                    .padding(.horizontal, 15)
                    .padding(.top, 15)
                }
                Button(action:{loanApplicationService.submitApplication()}) {
                    NavigationLink(destination: LoanApplicationComplete(), isActive: $submissionComplete) {EmptyView()}
                    ZStack {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(Color(red: 68 / 255, green: 159 / 255, blue: 100 / 255))
                            Text("Submit Application")
                            .font(.system(size: 21))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .frame(maxWidth:.infinity, alignment: .center)
                    }
                    .frame(height: loanApplicationService.showSubmitApplicationBtn ? 70 : 0)
                    .padding(.horizontal, 15)
                    .padding(.vertical, loanApplicationService.showSubmitApplicationBtn ? 15 : 0)
                
                }
            }
        }
        .navigationBarBackground {
            Color(red: 68 / 255, green: 159 / 255, blue: 100 / 255).shadow(radius: 1) // don't forget the shadow under the opaque navigation bar
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action:{print("back button hit")}) {
                    NavigationLink(destination: LoanPersonalQuestionsView(loanApplicationService: loanApplicationService)) {
                        HStack {
                            Image(systemName: "chevron.backward")
                                .font(Font.system(size: 18, weight: .regular))
                            Text("Back")
                        }
                    }
                }
            }
        }
     
    }
    func onCompletion() {
        print("completed")
    }
    
    
}

struct LoanUploadDocumentsView_Previews: PreviewProvider {
    static var previews: some View {
        LoanUploadDocumentsView(loanApplicationService: LoanApplicationService())
    }
}
