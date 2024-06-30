//
//  CalendarFriendCardView.swift
//  AFriendlyReminder
//
//  Created by Chelsea Crawford on 29/06/2024.
//

import SwiftUI

struct CalendarFriendCardView: View {
    let name: String
    let time: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(name)")
                .font(.headline)
            Spacer()
            HStack {
                Text("Next Reminder: ")
                Spacer()
                Label("\(time)", systemImage: "clock")
                    .labelStyle(.trailingIcon)
            }
            .font(.caption)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 80)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5)
        .foregroundColor(Color.black.opacity(10))
    }
}

struct CalendarFriendCardView_Previews: PreviewProvider {
    static var name = "Test Name"
    static var time = "10:00-18:00"
    static var previews: some View {
        CalendarFriendCardView(name: name, time: time)
    }
}
