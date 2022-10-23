//
//  EmptyNoteView.swift
//  Notie
//
//  Created by Daniel Waiguru on 23/10/2022.
//

import SwiftUI

struct EmptyNoteView: View {
    var body: some View {
        VStack(spacing: 5) {
            TitleTextView(text: "🗳Nothing in Here🗳")
            BodyTextView(text: "Your notes will appear here.")
        }
    }
}

struct EmptyNoteView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyNoteView()
    }
}
