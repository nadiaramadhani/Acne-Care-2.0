//
//  CustomDatePicker.swift
//  ACNIFY
//
//  Created by Local Administrator on 21/08/22.
//

import SwiftUI

struct CustomCalendar: View {
    @Binding var currentDate: Date
    @State var currentMonth: Int = 0
    @Binding var progressDay: Float
    @Binding var progressNight: Float
    @Binding var acneLogList: [AcneLog]?
    @Binding var dateSelected: Date?
    
    var action: () -> ()

    
    var body: some View {
        VStack(spacing: 5 ){
            let days: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
            HStack{
                
                Button  {
                    withAnimation {
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color("primaryGreen"))
                        .font(.title2.bold())
                }
                Spacer()
                
                
                VStack(alignment: .center, spacing: 10) {
//                    Text(extraDate()[0])
//                        .font(.caption)
//                        .fontWeight(.semibold)
                    Text(extraDate()[1])
                        .font(.title3.bold())
                        .foregroundColor(Color("primaryGreen"))
                }
                
               Spacer()
                
                Button  {
                    withAnimation {
                        currentMonth += 1
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color("primaryGreen"))
                        .font(.title2.bold())
                    
                    
                }

            }
            .padding(.horizontal)
            .padding(.bottom, 15)
            HStack(spacing: 0){
                ForEach(days, id: \.self) { day in
                    Text(day)
                        .font(.system(size: 11))
                        .fontWeight(.regular)
                        .frame(maxWidth: .infinity)
                    
                }
            }
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray)
            
            let columns = Array(repeating: GridItem(.flexible()) , count: 7)
            
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(extractDate()) { value in
                    let todayLogs = acneLogList?.filter{
                        $0.time! < value.date.dayAfter && $0.time! > value.date
                    }
                    
                    let dayLog = todayLogs?.filter{
                        $0.type == UserProduct.dayRoutineType
                    }.first
                    
                    let nightLog = todayLogs?.filter{
                        $0.type == UserProduct.nightRoutineType
                    }
                    .first
                    
                    CardView(value: DateValue(isSelected: value.date == dateSelected, dayLog: dayLog, nightLog: nightLog, id: value.id, day: value.day, date: value.date))
                        .onTapGesture {
                            dateSelected = value.date
                            action()
                        }
                }
            }
          
          
            
        }
        .frame(width: 338, height: 245)
        .onChange(of: currentMonth) { newValue in
            //updating month
            currentDate = getCurrentMonth()
        }
        
        
    
        
    }
    
    @ViewBuilder
    func CardView(value: DateValue)-> some View {
        VStack{
            if value.day != -1 {
                VStack{
                    Circle()
                        .frame(width: 8, height: 8)
                        .foregroundColor(Color("tosca"))
                        .padding(.leading, 15).opacity(value.nightLog?.image != nil ? 1 : 0)
                ZStack{
                    if value.isSelected {
                    RoundedRectangle(cornerRadius: 4)
                               .stroke(.red, lineWidth: 2)
                               .frame(width: 30, height: 30)
                    }
                    Circle()
                        .trim(from: 0.0, to: CGFloat(min(self.progressDay, 0.5)))
                        .stroke(style: StrokeStyle(lineWidth: 3.0, lineCap: .round, lineJoin: .round))
                        .foregroundColor(value.dayLog != nil ? Color("yellow") : Color.gray)
                        .rotationEffect(Angle(degrees: 270))
                    
                    Circle()
                        .trim(from: 0.5, to: CGFloat(min(self.progressNight, 1.0)))
                        .stroke(style: StrokeStyle(lineWidth: 3.0, lineCap: .round, lineJoin: .round))
                        .foregroundColor(value.nightLog != nil ? Color("purpleSummary"): Color.gray)
                        .rotationEffect(Angle(degrees: 270))
                        
                    
                Text("\(value.day)")
                        .font(.system(size: 11))
                    
                }
                }
            }
        }
        
        .padding(.vertical, 10)
        .frame(height: 60, alignment: .top)
        
        
    }
    
    
    func extraDate()-> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        let date = formatter.string(from: currentDate)
        return date.components(separatedBy: " ")
        
    }

    func getCurrentMonth()-> Date {
        let calendar = Calendar.current
 
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
            return Date()
            
        }
        
        return currentMonth
    }
    
    func extractDate() -> [DateValue]{
        let calendar = Calendar.current
 
        let currentMonth = getCurrentMonth()
        
       var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            
            let day = calendar.component(.day, from: date)
            
            return DateValue(day: day, date: date)
        }

//adding offset
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1 {
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        return days
    }
}



extension Date {
    func getAllDates() -> [Date] {
        let calendar = Calendar.current
        
        //getting start date
        
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        
        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
        
    }
}
//struct CustomCalendar_Previews: PreviewProvider {
//    static var previews: some View {
//        SummaryPageView()
//    }
//}
