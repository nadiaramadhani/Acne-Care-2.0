//
//  String+ToMarkdown.swift
//  ACNIFY
//
//  Created by Agus Budianto on 02/08/22.
//

import Foundation


extension String {
  func toMarkdown() -> AttributedString {
    do {
      return try AttributedString(markdown: self)
    } catch {
      print("Error parsing Markdown for string \(self): \(error)")
      return AttributedString(self)
    }
  }
}
