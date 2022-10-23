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
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.words)

                TextField("Description", text: $content)
                    .frame(height: 100.0, alignment: .top)

                Button("Save") {
                    saveNote()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(21.0)
                .alert(isPresented: $hasErrorOcurred, content) {
                    return Alert(title: Text("Failed!"), message: Text("Failed to add your note, Try again."),
                                 dismissButton: .default(Text("Ok")))
                }
            }

            }
            .navigationTitle("Add Note")

    }
    func saveNote() {
        let note = Note(context: self.manageObjectContext)
        note.id = UUID()
        note.title = "Note Title"
        note.content = "Note content"
        note.date = Date()
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
        AddEditNoteView()
    }
}
