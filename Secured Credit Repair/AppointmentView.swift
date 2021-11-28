//
//  AppointmentView.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 11/27/21.
//

import UIKit
import WebKit
import SwiftUI

struct SwiftUIWebView: UIViewRepresentable {
    
    let url: URL?
    
    func makeUIView(context: Context) -> WKWebView {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        return WKWebView(frame: .zero,
        configuration: config)
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let myURL = url else {
            return
        }
        let request = URLRequest(url: myURL)
        uiView.load(request)
    }
}

struct AppointmentsView: View {
    var body: some View {
        SwiftUIWebView(url: URL(string:"https://rodriguezfreelance.setmore.com/"))
    }
}

