//
//  EmployeeRepresentation.swift
//  Acacia Ridge Presents the Band App
//
//  Created by Alex Shillingford on 10/15/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation

enum Position: String {
    case agent = "agent"
    case manager = "manager"
    case bandMember = "band_member"
}

struct EmployeeRepresentation {
    var name: String
    var position: Position
    var email: String
    var password: String
    var id: UUID
    var isAdministrator: Bool
    var band: BandRepresentation
}
