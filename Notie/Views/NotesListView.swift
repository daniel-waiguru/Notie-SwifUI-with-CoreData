//
//  NotesListView.swift
//  Notie
//
//  Created by Daniel Waiguru on 21/10/2022.
//

import SwiftUI

struct NotesListView: View {
    @Environment(\.managedObjectContext) var manageObjectContext

    @State private var shouldShowAdd = false
    @FetchRequest(sortDescriptors: []) var notes: FetchedResults<Note>
    var body: some View {
        NavigationView {
            List {
                ForEach(notes) { note in
                    NavigationLink {

                    } label: {
                        NoteRowView(note: note)
                    }

                }

            }.navigationBarTitle(Text("My Notes"))
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink {
                            AddEditNoteView()
                        } label: {
                            Label("Hi", systemImage: "plus")
                        }
                    }
                }
        }
    }
}

struct NotesListView_Previews: PreviewProvider {
    static var previews: some View {
        NotesListView()
    }
}
