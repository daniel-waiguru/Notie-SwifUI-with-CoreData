//
//  TextViews.swift
//  Notie
//
//  Created by Daniel Waiguru on 23/10/2022.
//

import SwiftUI

struct TitleTextView: View {
    var text: String
    var body: some View {
        Text(text)
            .fontWeight(.semibold)
            .kerning(0.2)

    }
}

struct BodyTextView: View {
    var text: String
    var body: some View {
        Text(text)
            .kerning(0.2)
            .font(.subheadline)
    }
}

struct DateTextView: View {
    var date: Date
    var body: some View {
        Text(date, format: .dateTime)
            .font(.caption)
            .lineLimit(1)
            .kerning(1.5)
            .foregroundColor(.secondary)

    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TitleTextView(text: "Hello Title")
            BodyTextView(text: "Body")
            DateTextView(date: Date())
        }
    }
}
