//
//  Buttons.swift
//  Notie
//
//  Created by Daniel Waiguru on 23/10/2022.
//

import SwiftUI

struct SaveButton: View {
    var text: String
    let onSaveClicked: () -> Void
    @Binding var hasErrorOcurred: Bool
    var body: some View {
        Button(text) {
            onSaveClicked()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.blue)
        .foregroundColor(.white)
        .cornerRadius(10.0)
        .alert(isPresented: $hasErrorOcurred) {
            return Alert(title: Text("Failed!"), message: Text("Failed to add your note, Try again."),
                         dismissButton: .default(Text("Ok")))
        }
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        SaveButton(
            text: "Save", onSaveClicked: { }, hasErrorOcurred: .constant(false)
        )
    }
}
