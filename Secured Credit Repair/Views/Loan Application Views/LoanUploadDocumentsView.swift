//
//  LoanUploadDocumentsView.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 12/2/21.
//

import SwiftUI
import SwiftUINavigationBarColor

struct LoanUploadDocumentsView: View {
    @ObservedObject var loanApplicationService: LoanApplicationService
    @State var W2FileName: String = ""
    @State var frontDLFileName: String = ""
    @State var backDLFileName: String = ""
    @State var frontSCFileName: String = ""
    @State var backSCFileName: String = ""
    @State var voidCheckFileName: String = ""
    @State var utilityBillFileName: String = ""
    
    @State var W2ImporterBtn: Bool = false
    @State var frontDLImporterBtn: Bool = false
    @State var backDLImporterBtn: Bool = false
    @State var frontSCImporterBtn: Bool = false
    @State var backSCImporterBtn: Bool = false
    @State var voidCheckImporterBtn: Bool = false
    @State var utilityBillImporterBtn: Bool = false
    
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
                
                NavigationLink(destination: LoanUploadIdentityDocuments()) {
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
                NavigationLink(destination: LoanUploadAddressDocuments()) {
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
                
                NavigationLink(destination: LoanUploadIncomeDocuments()) {
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
            }
        }
        .navigationBarBackground {
            Color(red: 68 / 255, green: 159 / 255, blue: 100 / 255).shadow(radius: 1) // don't forget the shadow under the opaque navigation bar
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
