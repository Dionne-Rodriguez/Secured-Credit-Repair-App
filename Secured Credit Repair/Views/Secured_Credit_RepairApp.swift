//
//  Secured_Credit_RepairApp.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 11/27/21.
//

import SwiftUI
import Firebase

@main
struct Secured_Credit_RepairApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
