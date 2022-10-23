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
            Text(note.title ?? "Unknown")
                .font(.title3)
                .fontWeight(.bold)
                .lineLimit(1)
            Text(note.content ?? "Unknown")
                .font(.footnote)
                .lineLimit(3)

            Text(note.date ?? Date(), format: .dateTime)
                .font(.caption)
                .lineLimit(1)
        }
    }
}

struct NoteRowView_Previews: PreviewProvider {
    static var previews: some View {
        NoteRowView(note: Note())
    }
}
