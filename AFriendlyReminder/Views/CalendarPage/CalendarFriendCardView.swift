//
//  CalendarFriendCardView.swift
//  AFriendlyReminder
//
//  Created by Chelsea Crawford on 29/06/2024.
//

import SwiftUI

struct CalendarFriendCardView: View {
    let friend: Friend
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(friend.name)")
                .font(.headline)
            Spacer()
            HStack {
                Text("Next Reminder: ")
                Spacer()
                Label("\(friend.timeString)", systemImage: "clock")
                    .labelStyle(.trailingIcon)
            }
            .font(.caption)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 80)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: Theme.lavender.mainColor, radius: 5)
        .foregroundColor(Color.black.opacity(10))
    }
}

struct CalendarFriendCardView_Previews:
    PreviewProvider {
    static var friend = Friend.sampleFriends[0]
    static var previews: some View {
        CalendarFriendCardView(friend: friend)
    }
}
