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
    var DriverLisence: [URL]
    var SocialSecurityCard: [URL]
    var UtilityBill: [URL]
    var W2: [URL]
    var PayStubs: [URL]
    
}

enum Document {
    case DriverLisence
    case SocialSecurityCard
    case UtilityBill
    case W2
    case PayStubs
}
