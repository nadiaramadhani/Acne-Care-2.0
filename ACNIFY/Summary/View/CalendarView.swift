//
//  CalendarView.swift
//  ACNIFY
//
//  Created by Local Administrator on 21/08/22.
//

import SwiftUI

struct CalendarView: View {
    @State var currentDate: Date = Date()
    @State var progressDay : Float = 0.5
    @State var progressNight: Float = 1.0
    
    var body: some View {
            VStack {
                CustomCalendar(currentDate: $currentDate, progressDay: $progressDay, progressNight: $progressNight)
            }
        
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
