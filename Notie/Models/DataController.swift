//
//  DataController.swift
//  Notie
//
//  Created by Daniel Waiguru on 21/10/2022.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Notie")

    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed to load data \(error.localizedDescription)")
            }
        }
    }
}
