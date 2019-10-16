//
//  BandController.swift
//  Acacia Ridge Presents the Band App
//
//  Created by Alex Shillingford on 10/15/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation

class BandController {
    let baseURL = URL(string: "https://acaciaridgebandapp.firebaseio.com/")!
    
    func fetchBandInformationFromFirebase(employee: EmployeeRepresentation, completion: @escaping () -> Void = { }) {
        let requestURL = baseURL.appendingPathExtension("json")
        
        URLSession.shared.dataTask(with: requestURL) { (data, _, error) in
            if let error = error {
                NSLog("Error fetching information about band: \(error)")
            }
            
            guard let data = data else {
                NSLog("No data returned from data task")
                completion()
                return
            }
            
            do {
                let bandRepresentationInfo = try JSONDecoder().decode([String: BandRepresentation].self, from: data).map({ $0.value })
                employee.band = bandRepresentationInfo
            } catch {
                
            }
        }
    }
}
