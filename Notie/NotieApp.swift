//
//  NotieApp.swift
//  Notie
//
//  Created by Daniel Waiguru on 21/10/2022.
//

import SwiftUI

@main
struct NotieApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            NotesListView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
