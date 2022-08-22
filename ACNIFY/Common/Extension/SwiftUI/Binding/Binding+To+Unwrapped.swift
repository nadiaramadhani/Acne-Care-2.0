//
//  Binding+To+Unwrapped.swift
//  ACNIFY
//
//  Created by Agus Budianto on 22/08/22.
//

import SwiftUI


extension Binding {
     func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}
