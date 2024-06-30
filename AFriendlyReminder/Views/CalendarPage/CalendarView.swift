//
//  CalendarView.swift
//  AFriendlyReminder
//
//  Created by Chelsea Crawford on 28/06/2024.
//

import SwiftUI

struct CalendarView: View {
    @State private var date = Date()
    
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let currentDate = Date()
        
        var startComponents = DateComponents()
        startComponents.month = -1
        let startDate = calendar.date(byAdding: startComponents, to: currentDate) ?? currentDate
        
        var endComponents = DateComponents()
        endComponents.month = 4
        let endDate = calendar.date(byAdding: endComponents, to: currentDate) ?? currentDate
        
        return startDate ... endDate
    }()
    

    var body: some View {
        VStack {
            VStack {
                DatePicker(
                    "Pick a date",
                    selection: $date,
                    in: dateRange,
                    displayedComponents: [.date]
                )
                .padding()
                .datePickerStyle(.graphical)
                .background(
                    Color.white
                        .cornerRadius(10)
                        .shadow(color: Theme.lavender.mainColor, radius: 10, x: 0, y: 0)
                )
                
            }
            .padding(10)
            VStack {
                CalendarFriendCardView(name: "Friend Name 1", time: "18:00-21:00")
                CalendarFriendCardView(name: "Friend Name 2", time: "12:00-20:00")
            }
            .padding(10)
            Spacer()
        }
        .padding(10)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
