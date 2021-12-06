//
//  LoanUploadDocumentsView.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 12/2/21.
//

import SwiftUI

struct LoanUploadDocumentsView: View {
    @ObservedObject var loanApplicationService: LoanApplicationService
    @State var fileImporterBtn: Bool = false
    @State var fileName = ""
    var body: some View {
        VStack (spacing: 5){
            Section {
                Text("Upload last years W2 document")
                Button("Select File from File Manager") {
                    fileImporterBtn = true
                }.buttonStyle(.bordered)
                
                Text(fileName)
                    .fileImporter(isPresented: $fileImporterBtn, allowedContentTypes: [.pdf,.jpeg]) {
                        result in
                        if case .success = result {
                            do {
                                let fileUrl = try result.get()
                                loanApplicationService.uploadFile(file: fileUrl, fileName: "W2")
                            } catch {
                                let nsError = error as NSError
                                fatalError("File Import Error \(nsError), \(nsError.userInfo)")
                            }
                        } else {
                            print("File Import Failed")
                        }
                    }
            }
            Section {
                Text("Upload Front of Social Security Card")
                Button("Select File from File Manager") {
                    fileImporterBtn = true
                }.buttonStyle(.bordered)
                
                Text(fileName)
                    .fileImporter(isPresented: $fileImporterBtn, allowedContentTypes: [.pdf,.jpeg]) {
                        result in
                        if case .success = result {
                            do {
                                let fileUrl = try result.get()
                                loanApplicationService.uploadFile(file: fileUrl, fileName: "Front Social Card")
                            } catch {
                                let nsError = error as NSError
                                fatalError("File Import Error \(nsError), \(nsError.userInfo)")
                            }
                        } else {
                            print("File Import Failed")
                        }
                    }
            }
            Section {
                Text("Upload back of Social Security Card")
                Button("Select File from File Manager") {
                    fileImporterBtn = true
                }.buttonStyle(.bordered)
                
                Text(fileName)
                    .fileImporter(isPresented: $fileImporterBtn, allowedContentTypes: [.pdf,.jpeg]) {
                        result in
                        if case .success = result {
                            do {
                                let fileUrl = try result.get()
                                loanApplicationService.uploadFile(file: fileUrl, fileName: "Back Social Card")
                            } catch {
                                let nsError = error as NSError
                                fatalError("File Import Error \(nsError), \(nsError.userInfo)")
                            }
                        } else {
                            print("File Import Failed")
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
