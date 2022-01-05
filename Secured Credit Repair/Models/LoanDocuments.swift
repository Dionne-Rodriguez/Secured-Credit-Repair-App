//
//  LoanDocuments.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 12/4/21.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

struct LoanDocuments {
    var DriverLisence: [String]
    var SocialSecurityCard: [String]
    var UtilityBill: [String]
    var W2: [String]
    var PayStubs: [String]
    var BankStatements: [String]
    
}

enum Document {
    case DriverLisence
    case SocialSecurityCard
    case UtilityBill
    case W2
    case PayStubs
    case BankStatements
}
