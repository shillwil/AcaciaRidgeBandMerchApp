//
//  ShowRepresentation.swift
//  Acacia Ridge Presents the Band App
//
//  Created by Alex Shillingford on 10/15/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation

struct ShowRepresentation: Codable {
    var venue: String
    var date: Date
    var setLength: String
    var contact: ContactRepresentation
    var ticketsOnHand: Int
    var ticketsSold: Int
    var revenueFromTickets: Double
    var revenueFromMerch: Double
}
