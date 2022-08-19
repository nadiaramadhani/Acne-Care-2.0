//
//  Date+FormattedString.swift
//  ACNIFY
//
//  Created by Agus Budianto on 18/08/22.
//

import Foundation

extension Date {

    func formattedString(_ format: String = "dd MMMM yyyy") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}
