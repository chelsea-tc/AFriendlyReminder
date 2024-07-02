//
//  FriendView.swift
//  AFriendlyReminder
//
//  Created by Chelsea Crawford on 30/06/2024.
//

import SwiftUI

struct FriendView: View {
    var friend: Friend
    @State private var notes: String = ""
    
//    VStack(alignment: .leading) {
//        Text("\(name)")
//            .font(.headline)
//        Spacer()
//        VStack {
//            Spacer()
//            HStack {
//                Text("Category: ")
//                Spacer()
//                Label("\(category.name)", systemImage: category.icon)
//                    .labelStyle(.trailingIcon)
//            }
//            Spacer()
//            HStack {
//                Text("Next Reminder: ")
//                Spacer()
//                Label("\(next)", systemImage: "calendar")
//                    .labelStyle(.trailingIcon)
//            }
//            Spacer()
//            HStack {
//                Text("Time Range: ")
//                Spacer()
//                Label("\(time)", systemImage: "clock")
//                    .labelStyle(.trailingIcon)
//            }
//            Spacer()
//        }
//        .font(.caption)
//    }
//    .padding()
//    .frame(maxWidth: .infinity, maxHeight: 120)
//    .cornerRadius(10)
//    .foregroundColor(Color.black.opacity(10))

    var body: some View {
        List {
            // Info Section
            Section(header: Text("Info").font(.headline).foregroundColor(Theme.navy.mainColor)) {
                infoRow(label: "Category", systemImage: "paintpalette", value: friend.category.name, backgroundColor: friend.category.catColor)
                infoRow(label: "Next Reminder", systemImage: "calendar", value: friend.next)
                infoRow(label: "Time Interval", systemImage: "clock", value: friend.time)
            }
            
            Section(header: Text("Important Dates").font(.headline).foregroundColor(Theme.navy.mainColor)) {
                dateRow(date: "12/03/24", frequency: "yearly")
                dateRow(date: "10/12/23", frequency: "monthly")
            }
            
            Section(header: Text("Notes").font(.headline).foregroundColor(Theme.navy.mainColor)) {
                TextEditor(text: $notes)
                    .frame(height: 200)
                    .padding(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Theme.navy.mainColor.opacity(0.5), lineWidth: 1)
                        )
                    .padding(8)
            }
            
            Section(header: Text("Hitory").font(.headline).foregroundColor(Theme.navy.mainColor)) {
                historyRow(date: "12/05/23", completed: true)
                historyRow(date: "12/03/13", completed: false)
            }
            

        }
        .toolbar {
            Button("Edit") {
                
            }
        }
    }
    
    // Custom Views for Rows
    private func infoRow(label: String, systemImage: String, value: String, backgroundColor: Color? = nil) -> some View {
        HStack {
            Text(label)
            Spacer()
            Text(value)
                .padding(4)
                .foregroundColor(backgroundColor == Theme.navy.mainColor ? .white : .black)
                .background(backgroundColor ?? .white)
                .cornerRadius(4)
        }
        .padding(.vertical, 4)
    }
    
    private func dateRow(date: String, frequency: String) -> some View {
        HStack {
            Label(date, systemImage: "calendar")
            Spacer()
            Text(frequency)
                .padding(8)
                .font(.caption)
        }
        .padding(.vertical, 4)
    }
    
    private func historyRow(date: String, completed: Bool) -> some View {
        HStack {
            Label(date, systemImage: completed ? "checkmark.square" : "square")
            Spacer()
        }
        .padding(.vertical, 4)
    }
    
}


struct FriendView_Previews: PreviewProvider {
    static var friend = Friend.sampleFriends[0]
    static var previews: some View {
        FriendView(friend: friend)
    }
}
