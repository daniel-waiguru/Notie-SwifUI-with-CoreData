//
//  ContentView.swift
//  Notie
//
//  Created by Daniel Waiguru on 21/10/2022.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Note.date, ascending: false)]) var notes: FetchedResults<Note>
    @State private var hasErrorOcurred = false
    @Environment(\.managedObjectContext) var manageObjectContext
    var body: some View {
        NavigationView {
            VStack {
                if notes.isEmpty {
                    EmptyNoteView()
                } else {
                    List {
                        ForEach(notes) { note in
                            NavigationLink {
                                AddEditNoteView(note: note)
                            } label: {
                                NoteRowView(note: note)
                            }

                        }.onDelete { indexSet in
                            deleteNote(indexSet: indexSet)
                        }.alert("Error Deleting", isPresented: $hasErrorOcurred) {
                            Button("Ok", role: .cancel) { hasErrorOcurred.toggle()}
                        }

                    }
                }

            }.navigationBarTitle(Text("My Notes"))
                .navigationBarItems(
                    trailing: NavigationLink {
                        AddEditNoteView(note: nil)
                    } label: {
                        Label("Add Note", systemImage: "plus")
                    }
                )

        }
    }
    func deleteNote(indexSet: IndexSet) {
        for index in indexSet {
            manageObjectContext.delete(notes[index])
        }
        do {
            try manageObjectContext.save()
        } catch {
            hasErrorOcurred.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
