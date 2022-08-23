//
//  CalendarModel.swift
//  ACNIFY
//
//  Created by Local Administrator on 21/08/22.
//

import SwiftUI

struct DateValue: Identifiable {
    var isSelected: Bool = false
    var dayLog: AcneLog?
    var nightLog: AcneLog?
    var id = UUID().uuidString
    var day : Int
    var date: Date
}


