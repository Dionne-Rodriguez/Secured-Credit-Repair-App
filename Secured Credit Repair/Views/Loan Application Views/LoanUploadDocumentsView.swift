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
                
                VStack (alignment: .leading, spacing: 20) {
                    Section {
                        HStack{
                            Text("Upload last years W2 document:")
                            Text(W2FileName)
                        }
                        .padding(.top)
                        HStack {
                            Button("File Manager") {
                                W2ImporterBtn = true
                            }
                            .buttonStyle(.bordered)
                            .fileImporter(isPresented: $W2ImporterBtn, allowedContentTypes: [.pdf,.jpeg]) {
                                result in
                                if case .success = result {
                                    do {
                                        let fileUrl = try result.get()
                                        W2FileName = fileUrl.lastPathComponent
                                        loanApplicationService.uploadFile(file: fileUrl, fileName: "W2")
                                    } catch {
                                        let nsError = error as NSError
                                        fatalError("File Import Error \(nsError), \(nsError.userInfo)")
                                    }
                                } else {
                                    print("File Import Failed")
                                }
                            }
                            
                            Button("Photo Gallery") {
                                W2ImporterBtn = true
                            }
                            .buttonStyle(.bordered)
                        }
                        
                    }
                    Section {
                        HStack {
                            Text("Upload front of Driver's License: ")
                            Text(frontDLFileName)
                        }
                        .padding(.top)
                        HStack {
                        Button("File Manager") {
                            frontDLImporterBtn = true
                        }
                        .buttonStyle(.bordered)
                        .fileImporter(isPresented: $frontDLImporterBtn, allowedContentTypes: [.pdf,.jpeg]) {
                            result in
                            if case .success = result {
                                do {
                                    let fileUrl = try result.get()
                                    frontDLFileName = fileUrl.lastPathComponent
                                    loanApplicationService.uploadFile(file: fileUrl, fileName: "Front DL")
                                } catch {
                                    let nsError = error as NSError
                                    fatalError("File Import Error \(nsError), \(nsError.userInfo)")
                                }
                            } else {
                                print("File Import Failed")
                            }
                        }
                        Button("Photo Gallery") {
                            W2ImporterBtn = true
                        }
                        .buttonStyle(.bordered)
                        }
                    }
                    Section {
                        HStack{
                            Text("Upload back of Driver's License: ")
                            Text(backDLFileName)
                        }
                        .padding(.top)
                        HStack {
                        Button("File Manager") {
                            backDLImporterBtn = true
                        }
                        .buttonStyle(.bordered)
                        .fileImporter(isPresented: $backDLImporterBtn, allowedContentTypes: [.pdf,.jpeg]) {
                            result in
                            if case .success = result {
                                do {
                                    let fileUrl = try result.get()
                                    backDLFileName = fileUrl.lastPathComponent
                                    loanApplicationService.uploadFile(file: fileUrl, fileName: "Back Driver's License")
                                } catch {
                                    let nsError = error as NSError
                                    fatalError("File Import Error \(nsError), \(nsError.userInfo)")
                                }
                            } else {
                                print("File Import Failed")
                            }
                        }
                        Button("Photo Gallery") {
                            W2ImporterBtn = true
                        }
                    }
                    }
                    Section {
                        HStack {
                            Text("Upload Front of Social Security Card: ")
                            Text(frontSCFileName)
                        }
                        .padding(.top)
                        HStack {
                        Button("File Manager") {
                            frontSCImporterBtn = true
                        }.buttonStyle(.bordered)
                            .fileImporter(isPresented: $frontSCImporterBtn, allowedContentTypes: [.pdf,.jpeg]) {
                                result in
                                if case .success = result {
                                    do {
                                        let fileUrl = try result.get()
                                        frontSCFileName = fileUrl.lastPathComponent
                                        loanApplicationService.uploadFile(file: fileUrl, fileName: "Front Social Card")
                                    } catch {
                                        let nsError = error as NSError
                                        fatalError("File Import Error \(nsError), \(nsError.userInfo)")
                                    }
                                } else {
                                    print("File Import Failed")
                                }
                            }
                        Button("Photo Gallery") {
                            W2ImporterBtn = true
                        }
                    }
                    }
                    Section {
                        HStack {
                            Text("Upload back of Social Security Card:")
                            Text(backSCFileName)
                        }
                        .padding(.top)
                        HStack {
                        Button("File Manager") {
                            backSCImporterBtn = true
                        }
                        .buttonStyle(.bordered)
                        .fileImporter(isPresented: $backSCImporterBtn, allowedContentTypes: [.pdf,.jpeg]) {
                            result in
                            if case .success = result {
                                do {
                                    let fileUrl = try result.get()
                                    backSCFileName = fileUrl.lastPathComponent
                                    loanApplicationService.uploadFile(file: fileUrl, fileName: "Back Social Card")
                                } catch {
                                    let nsError = error as NSError
                                    fatalError("File Import Error \(nsError), \(nsError.userInfo)")
                                }
                            } else {
                                print("File Import Failed")
                            }
                        }
                        Button("Photo Gallery") {
                            W2ImporterBtn = true
                        }
                        }
                    }
                    Section {
                        HStack {
                            Text("Most recent utility bill - gas, electric, water, cell phone/cable is accepted:")
                                 
                            Text(utilityBillFileName)
                        }
                        HStack {
                        Button("File Manager") {
                            utilityBillImporterBtn = true
                        }
                        .buttonStyle(.bordered)
                        .fileImporter(isPresented: $utilityBillImporterBtn, allowedContentTypes: [.pdf,.jpeg]) {
                            result in
                            if case .success = result {
                                do {
                                    let fileUrl = try result.get()
                                    utilityBillFileName = fileUrl.lastPathComponent
                                    loanApplicationService.uploadFile(file: fileUrl, fileName: "Utility Bill")
                                } catch {
                                    let nsError = error as NSError
                                    fatalError("File Import Error \(nsError), \(nsError.userInfo)")
                                }
                            } else {
                                print("File Import Failed")
                            }
                        }
                            Button("Photo Gallery") {
                                utilityBillImporterBtn = true
                            }
                        }
                    }
                    Section {
                        HStack {
                            Text("Voided check from personal account (name must be printed on check): ")
                            Text(voidCheckFileName)
                        }
                        HStack {
                        Button("File Manager") {
                            voidCheckImporterBtn = true
                        }
                        .buttonStyle(.bordered)
                        .fileImporter(isPresented: $voidCheckImporterBtn, allowedContentTypes: [.pdf,.jpeg]) {
                            result in
                            if case .success = result {
                                do {
                                    let fileUrl = try result.get()
                                    voidCheckFileName = fileUrl.lastPathComponent
                                    loanApplicationService.uploadFile(file: fileUrl, fileName: "Voided Check")
                                } catch {
                                    let nsError = error as NSError
                                    fatalError("File Import Error \(nsError), \(nsError.userInfo)")
                                }
                            } else {
                                print("File Import Failed")
                            }
                        }
                            Button("Photo Gallery") {
                                voidCheckImporterBtn = true
                            }
                        }
                    }
                    Section {
                        HStack {
                            Text("month one of bank statements")
                            Text(voidCheckFileName)
                        }
                        HStack {
                        Button("File Manager") {
                            voidCheckImporterBtn = true
                        }
                        .buttonStyle(.bordered)
                        .fileImporter(isPresented: $voidCheckImporterBtn, allowedContentTypes: [.pdf,.jpeg]) {
                            result in
                            if case .success = result {
                                do {
                                    let fileUrl = try result.get()
                                    voidCheckFileName = fileUrl.lastPathComponent
                                    loanApplicationService.uploadFile(file: fileUrl, fileName: "Voided Check")
                                } catch {
                                    let nsError = error as NSError
                                    fatalError("File Import Error \(nsError), \(nsError.userInfo)")
                                }
                            } else {
                                print("File Import Failed")
                            }
                        }
                            Button("Photo Gallery") {
                                voidCheckImporterBtn = true
                            }
                        }
                    }
                    Section {
                        HStack {
                            Text("month two of bank statements ")
                            Text(voidCheckFileName)
                        }
                        HStack {
                        Button("File Manager") {
                            voidCheckImporterBtn = true
                        }
                        .buttonStyle(.bordered)
                        .fileImporter(isPresented: $voidCheckImporterBtn, allowedContentTypes: [.pdf,.jpeg]) {
                            result in
                            if case .success = result {
                                do {
                                    let fileUrl = try result.get()
                                    voidCheckFileName = fileUrl.lastPathComponent
                                    loanApplicationService.uploadFile(file: fileUrl, fileName: "Voided Check")
                                } catch {
                                    let nsError = error as NSError
                                    fatalError("File Import Error \(nsError), \(nsError.userInfo)")
                                }
                            } else {
                                print("File Import Failed")
                            }
                        }
                            Button("Photo Gallery") {
                                voidCheckImporterBtn = true
                            }
                        }
                    }
                    Section {
                        HStack {
                            Text("month three of bank statement")
                            Text(voidCheckFileName)
                        }
                        HStack {
                        Button("File Manager") {
                            voidCheckImporterBtn = true
                        }
                        .buttonStyle(.bordered)
                        .fileImporter(isPresented: $voidCheckImporterBtn, allowedContentTypes: [.pdf,.jpeg]) {
                            result in
                            if case .success = result {
                                do {
                                    let fileUrl = try result.get()
                                    voidCheckFileName = fileUrl.lastPathComponent
                                    loanApplicationService.uploadFile(file: fileUrl, fileName: "Voided Check")
                                } catch {
                                    let nsError = error as NSError
                                    fatalError("File Import Error \(nsError), \(nsError.userInfo)")
                                }
                            } else {
                                print("File Import Failed")
                            }
                        }
                            Button("Photo Gallery") {
                                voidCheckImporterBtn = true
                            }
                        }
                    }
//                    Section {
////                        HStack {
////                            Text("One month worth of paystubs")
////                            Text(voidCheckFileName)
////                        }
////                        HStack {
////                        Button("File Manager") {
////                            voidCheckImporterBtn = true
////                        }
////                        .buttonStyle(.bordered)
////                        .fileImporter(isPresented: $voidCheckImporterBtn, allowedContentTypes: [.pdf,.jpeg]) {
////                            result in
////                            if case .success = result {
////                                do {
////                                    let fileUrl = try result.get()
////                                    voidCheckFileName = fileUrl.lastPathComponent
////                                    loanApplicationService.uploadFile(file: fileUrl, fileName: "Voided Check")
////                                } catch {
////                                    let nsError = error as NSError
////                                    fatalError("File Import Error \(nsError), \(nsError.userInfo)")
////                                }
////                            } else {
////                                print("File Import Failed")
////                            }
////                        }
////                            Button("Photo Gallery") {
////                                voidCheckImporterBtn = true
////                            }
////                        }
//                    }
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
