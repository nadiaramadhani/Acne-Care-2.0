//
//  Date+Today+Display+Time.swift
//  ACNIFY
//
//  Created by Agus Budianto on 23/08/22.
//

import Foundation


extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
    
    func getMonthName() -> String {
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "LLLL"
        let nameOfMonth = dateFormatter.string(from: self)
        
        return nameOfMonth
    }
    
    func getDayName() -> String {
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "EEEE"
        let nameOfMonth = dateFormatter.string(from: self)
        
        return nameOfMonth
    }
    
    func getDisplayedTime() -> String {
        return "\(Date().getDayName()), \(Date().get(.day)) \(Date().getMonthName())"
    }
}
