//
//  ContactRepresentation.swift
//  Acacia Ridge Presents the Band App
//
//  Created by Alex Shillingford on 10/15/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation

struct ContactRepresentation {
    enum ContactCategory: String {
        case promoter
        case agent
        case manager
        case venue
    }
    
    var name: String
    var number: Int
    var email: String
    var employer: String
    var bio: String?
    var contactCategory: ContactCategory
}
