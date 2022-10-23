//
//  Extensions.swift
//  Notie
//
//  Created by Daniel Waiguru on 23/10/2022.
//

import Foundation
import SwiftUI

extension Binding {
     func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}

extension Optional {
    func `let`(_ unwrapped: (Wrapped) -> Void) {
        if case let .some(value) = self {
            unwrapped(value)
        }
      }
}
