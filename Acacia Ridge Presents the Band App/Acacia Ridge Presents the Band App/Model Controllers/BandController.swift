//
//  BandController.swift
//  Acacia Ridge Presents the Band App
//
//  Created by Alex Shillingford on 10/15/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation

class BandController {
    
    // MARK: - Properties
    static var shared = BandController()
    private(set) var employee = [EmployeeRepresentation]()
    var currentBand: BandRepresentation?
    
    private var persistentFileURL: URL? {
        let fm = FileManager.default
        guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return dir.appendingPathExtension("employee.plist")
    }
    
    let baseURL = URL(string: "https://acaciaridgebandapp.firebaseio.com/")!
    
    // MARK: - Networking Methods
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
                var bandRepresentations = try JSONDecoder().decode([String: BandRepresentation].self, from: data).map({ $0.value })
                for band in bandRepresentations {
                    if employee.bandID == band.id {
                        self.currentBand = band
                        bandRepresentations = []
                    } else {
                        continue
                    }
                }
                
            } catch {
                
            }
        }.resume()
    }
    // MARK: - CRUD Methods
    @discardableResult func createEmployee(name: String,
                        position: Position,
                        email: String,
                        password: String,
                        id: UUID,
                        isAdministrator: Bool,
                        bandID: UUID) -> EmployeeRepresentation {
        
        let employee = EmployeeRepresentation(name: name,
                                              position: position.rawValue,
                                              email: email,
                                              password: password,
                                              id: id,
                                              isAdministrator: isAdministrator,
                                              bandID: bandID)
        
        let context = CoreDataStack.shared.mainContext
        
        context.performAndWait {
            CoreDataStack.shared.save()
        }
        
        return employee
    }
    
    // MARK: - Persistent Store Methods
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        do {
            let data = try PropertyListEncoder().encode(employee)
            try data.write(to: url)
        } catch {
            NSLog("Error saving employee data to native persistent store: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fm = FileManager.default
        guard let url = persistentFileURL,
            fm.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            employee = try PropertyListDecoder().decode([EmployeeRepresentation].self, from: data)
        } catch {
            NSLog("Error loading employee data: \(error)")
        }
    }
}
