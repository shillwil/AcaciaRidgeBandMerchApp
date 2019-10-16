//
//  Band.swift
//  Acacia Ridge Presents the Band App
//
//  Created by Alex Shillingford on 10/10/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation

struct BandRepresentation {
    var name: String
    var members: [EmployeeRepresentation]
    let id: UUID?
    var email: String
}
