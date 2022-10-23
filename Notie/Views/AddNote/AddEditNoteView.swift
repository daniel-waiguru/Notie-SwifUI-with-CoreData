//
//  AddEditNoteView.swift
//  Notie
//
//  Created by Daniel Waiguru on 23/10/2022.
//

import SwiftUI

struct AddEditNoteView: View {
    @Environment(\.managedObjectContext) var manageObjectContext
    @State private var title: String = ""
    @State private var content: String = ""
    @State private var hasErrorOcurred = false
    var note: Note?
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.words)
                    .fontWeight(.semibold)
                    .kerning(0.2)
                TextField("Description", text: $content)
                    .frame(height: 100.0, alignment: .top)
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.sentences)
                    .kerning(0.2)
                    .font(.subheadline)
                SaveButton(text: "Save", onSaveClicked: {
                    saveNote()
                }, hasErrorOcurred: $hasErrorOcurred)
            }.navigationTitle("Add Note")
                .frame(maxHeight: .infinity, alignment: .top)
        }
    }
    private func saveNote() {
        let newOrUpdatedNote = Note(context: self.manageObjectContext)
        if note != nil {
            newOrUpdatedNote.id = self.note?.id
        } else {
            newOrUpdatedNote.id = UUID()
        }
        newOrUpdatedNote.title = title
        newOrUpdatedNote.content = content
        newOrUpdatedNote.date = Date()
        do {
            try manageObjectContext.save()
        } catch {
            hasErrorOcurred.toggle()
            print("Error saving note \(error.localizedDescription)")
        }

    }
}



struct AddEditNoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddEditNoteView(note: nil)
    }
}
