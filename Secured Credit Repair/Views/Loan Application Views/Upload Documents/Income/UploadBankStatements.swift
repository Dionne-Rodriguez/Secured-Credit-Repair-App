//
//  UploadBankStatements.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 1/2/22.
//

import SwiftUI

struct UploadBankStatements : View {
    @ObservedObject var loanApplicationService: LoanApplicationService
    @State var selected : [SelectedImages] = []
    @State var show = false
    @State var continueBtnActive = false
    @State var disableBtn = true
    
    var body: some View{
        ZStack {
            
            Color.black.opacity(0.07).edgesIgnoringSafeArea(.all)
            
            VStack{
                Spacer()
                Text("Bank Statements")
                    .bold()
                    .font(.title3)
                    .padding()
                
                Text("Select three month's worth of bank statements")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                
                
                if !self.selected.isEmpty{
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack(spacing: 20){
                            
                            ForEach(self.selected,id: \.self){ i in
                                
                                Image(uiImage: i.image)
                                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width - 40, height: 250)
                                    .cornerRadius(15)
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                }
                
                Button(action: {
                    
                    self.selected.removeAll()
                    
                    self.show.toggle()
                    
                }) {
                    
                    Text("Select Image(s)")
                        .foregroundColor(.white)
                        .padding(.vertical,10)
                        .frame(width: UIScreen.main.bounds.width / 2)
                }
                .background(Color(red: 68 / 255, green: 159 / 255, blue: 100 / 255))
                .clipShape(Capsule())
                .padding(.top, 25)
                Spacer()
                
                NavigationLink(destination: LoanUploadIncomeDocuments(loanApplicationService: loanApplicationService), isActive: $loanApplicationService.uploadComplete) {EmptyView()}
                
                Button(action:{ loanApplicationService.submitImages(selected: selected, fileName: Document.BankStatements) }) {
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
                }.disabled(disableBtn)
                    .padding(.top, 20)
            }
            .onAppear(perform: reset)
            GeometryReader {_ in
                Color.clear
                    .modifier(Popup(isPresented: loanApplicationService.progressBar,
                                    content: { ProgressBar(uploadProgress: loanApplicationService.uploadAmount) }))
            }.background(
                Color.black.opacity(0.65)
                    .edgesIgnoringSafeArea(.all)
            )
                .PayStubsProgressBarViewIsHidden(loanApplicationService.hideProgressBar)
            
            if self.show {
                CustomPicker(selected: self.$selected, show: self.$show).onDisappear(perform: didDismiss)
            }

        }
    }
    
    func didDismiss() {
        if !self.selected.isEmpty {
            self.disableBtn = false
        }
    }
    
    func reset() {
        loanApplicationService.uploadComplete = false
    }
    
}



struct UploadBankStatements_Previews: PreviewProvider {
    static var previews: some View {
        UploadBankStatements(loanApplicationService: LoanApplicationService())
    }
}


