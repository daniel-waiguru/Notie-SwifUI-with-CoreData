//
//  NotesListView.swift
//  Notie
//
//  Created by Daniel Waiguru on 21/10/2022.
//

import SwiftUI

struct NotesListView: View {
    @Environment(\.managedObjectContext) var manageObjectContext
    @FetchRequest(sortDescriptors: []) var notes: FetchedResults<Note>
    var body: some View {
        VStack {
            List(notes) { note in
                Text(note.title ?? "Unknown")
            }

            Button(action: {
                let note = Note(context: manageObjectContext)
                note.id = UUID()
                note.title = "Note Title"
                note.content = "Note content"
                try? manageObjectContext.save()
            }) {
                Text("Save")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NotesListView()
    }
}
