//
//  PopUp.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 1/9/22.
//

import SwiftUI

struct Popup<T: View>: ViewModifier {
    let popup: T
    let isPresented: Bool

    // 1.
    init(isPresented: Bool, @ViewBuilder content: () -> T) {
        self.isPresented = isPresented
        popup = content()
    }

    // 2.
    func body(content: Content) -> some View {
        content
            .overlay(popupContent())
    }

    // 3.
    @ViewBuilder private func popupContent() -> some View {
        GeometryReader { geometry in
            if isPresented {
                popup
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
    }
}
//struct Popup_Previews: PreviewProvider {
//    static var previews: some View {
//        Popup(isPresented: true, content: content: { Color.yellow.frame(width: 100, height: 100) }))
//    }
//}

struct Popup_Previews: PreviewProvider {
    static var previews: some View {
        Color.clear
            .modifier(Popup(isPresented: true,
                            content: { ProgressBar(uploadProgress: 0.20) }))
            .previewDevice("iPod touch")
    }
}
