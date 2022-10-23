//
//  AddEditNoteViewModel.swift
//  Notie
//
//  Created by Daniel Waiguru on 23/10/2022.
//

import Foundation
import SwiftUI

class AddEditNoteViewModel: ObservableObject {
    @Environment(\.managedObjectContext) var manageObjectContext
    func saveNote(note: Note) {
        try? manageObjectContext.save()
    }
}
