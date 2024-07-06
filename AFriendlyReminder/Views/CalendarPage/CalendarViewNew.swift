//
//  CalendarViewNew.swift
//  AFriendlyReminder
//
//  Created by Chelsea Crawford on 06/07/2024.
//

import SwiftUI
import MooCal

struct CalendarViewNew: View {
    var friends: [Friend]
    
    @State private var selectedDay: CalendarDay? = nil
    var viewModel: ScrollableCalendarViewViewModel
    
    init(friends: [Friend]) {
        self.viewModel = ScrollableCalendarViewViewModel()
        self.friends = friends
    }
    
    var body: some View {
        VStack {
            ScrollableCalendarView(
                viewModel: viewModel,
                calendarDayView: .custom(
                    { calendarDay in
                        customCalendarDayView(calendarDay) // <-- HERE
                    }
                )
            )
            
            if let selectedDay = selectedDay {
                dayDetailsView(for: selectedDay)
                    .transition(.slide)
                    .animation(.easeInOut, value: selectedDay)
            } 
        }
    }
    
    private func customCalendarDayView(_ calendarDay: CalendarDay) -> some View {
        let today = Calendar.current.startOfDay(for: Date())
        let calendarDayDate = calendarDay.date
        
        let isToday = Calendar.current.isDateInToday(calendarDayDate)
        let isWeekend = Calendar.current.isDateInWeekend(calendarDayDate)
        let isPast = calendarDayDate < today
        let isSelected = calendarDay == selectedDay
        
        return ZStack {
            if isToday {
                RoundedRectangle(cornerRadius: 100.0)
                    .foregroundStyle(Theme.bubblegum.mainColor.opacity(0.3))
            } else if isWeekend {
                RoundedRectangle(cornerRadius: 100.0)
                    .foregroundStyle(Color.blue.opacity(0.1))
            } else if isPast {
                RoundedRectangle(cornerRadius: 100.0)
                    .foregroundStyle(Color.gray.opacity(0.1))
            } else if isSelected {
                RoundedRectangle(cornerRadius: 100.0)
                    .foregroundStyle(Theme.poppy.mainColor.opacity(0.3))
            } else {
                RoundedRectangle(cornerRadius: 100.0)
                    .foregroundStyle(Theme.lavender.mainColor.opacity(0.3))
            }
            
            Text(calendarDay.descriptor)
                .bold()
                .foregroundColor(isPast ? Color.gray : Color.black)
        }
        .aspectRatio(contentMode: .fit)
        .onTapGesture {
            if selectedDay == calendarDay {
                selectedDay = nil
            } else {
                selectedDay = calendarDay
            }
        }
    }
    
    private func dayDetailsView(for day: CalendarDay) -> some View {
        ScrollView {
            ForEach(friends, id: \.id) { friend in
                NavigationLink (destination: FriendView(friend: friend)) {
                    CalendarFriendCardView(friend: friend)
                }
            }
            .padding(10)
        }
    }
}

struct CalendarViewNew_Previews: PreviewProvider {
    static var friends = Friend.sampleFriends
    static var previews: some View {
        CalendarViewNew(friends: friends)
    }
}

