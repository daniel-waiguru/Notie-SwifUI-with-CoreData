//
//  ContentView.swift
//  Notie
//
//  Created by Daniel Waiguru on 21/10/2022.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(sortDescriptors: []) var notes: FetchedResults<Note>
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
