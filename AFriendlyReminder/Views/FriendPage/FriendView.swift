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


    var body: some View {
        List {
            // Info Section
            Section(header: Text("Info").font(.headline).foregroundColor(Theme.navy.mainColor)) {
                infoRow(label: "Name", systemImage: "person", value: friend.name)
                infoRow(label: "Category", systemImage: "paintpalette", value: friend.category.name, backgroundColor: friend.category.catColor)
                infoRow(label: "Next Reminder", systemImage: "calendar", value: friend.next)
                infoRow(label: "Time Interval", systemImage: "clock", value: friend.timeString)
            }
            
            Section(header: Text("Important Dates").font(.headline).foregroundColor(Theme.navy.mainColor)) {
                ForEach(friend.importantDates, id: \.id) { date in
                    importantDateRow(importantDate: date)
                }
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
    
    
    private func importantDateRow(importantDate: ImportantDate) -> some View {
        HStack {
            Label(importantDate.stringFormat, systemImage: "calendar")
            Spacer()
            Text(importantDate.frequency.name)
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
