//
//  CalendarView.swift
//  AFriendlyReminder
//
//  Created by Chelsea Crawford on 28/06/2024.
//

import SwiftUI

struct CalendarView: View {
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack {
            Text("Select a Date")
                .font(.title)
                .padding()
            DatePicker("Date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
            Spacer()
        }
        .navigationBarTitle("Calendar", displayMode: .inline)
        
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
