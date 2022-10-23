//
//  NoteRowView.swift
//  Notie
//
//  Created by Daniel Waiguru on 21/10/2022.
//

import SwiftUI

struct NoteRowView: View {
    var note: Note
    var body: some View {
        VStack(alignment: .leading) {
            TitleTextView(text: note.title ?? "Unknown")
                .lineLimit(1)
            BodyTextView(text: note.content ?? "Unknown")
                .lineLimit(3)
            DateTextView(date: note.date ?? Date())
        }
    }
}

struct NoteRowView_Previews: PreviewProvider {
    static var previews: some View {
        NoteRowView(note: Note())
    }
}
