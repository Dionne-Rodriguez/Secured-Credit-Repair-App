//
//  ProgressBar.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 1/9/22.
//

import SwiftUI



struct ProgressBar: View {
     var uploadProgress: Double
    
    var body: some View {
        VStack {
            Text("Uploading...")
                .font(.title)
                .foregroundColor(.white)
        ProgressView("", value: uploadProgress ,total: 1.00)
        .foregroundColor(.green)
        .accentColor(Color(red: 68 / 255, green: 159 / 255, blue: 100 / 255))
//        .frame(height: 0)
        .animation(.spring())
        .scaleEffect(x: 1, y: 4, anchor: .center)
//        .hidden()
        }
        .padding(.horizontal)
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(uploadProgress: 0.4050737695577689)
    }
}
