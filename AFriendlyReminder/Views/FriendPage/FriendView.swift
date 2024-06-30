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
            Section(header: Text("Info")) {
                HStack {
                    Label("Category", systemImage: "paintpalette")
                    Spacer()
                    Text("\(friend.category.name)")
                        .padding(4)
                        .foregroundColor(.white)
                        .background(friend.category.catColor)
                        .cornerRadius(4)
                }
                HStack {
                    Label("Next Reminder", systemImage: "calendar")
                    Spacer()
                    Text("\(friend.next)")
                }
                HStack {
                    Label("Time Interval", systemImage: "clock")
                    Spacer()
                    Text("\(friend.time)")
                }
            }
            Section(header: Text("Important Dates")) {
                HStack {
                    Label("12/03/24", systemImage: "calendar")
                    Spacer()
                    Text("yearly")
                        .font(.caption)
                }
                HStack {
                    Label("10/05/24", systemImage: "calendar")
                    Spacer()
                    Text("mothly")
                        .font(.caption)
                }
            }
            Section(header: Text("Notes")) {
                TextEditor(text: $notes)
                    .frame(height: 200) // Adjust height as needed
                    .padding(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    )
                    .padding(8)
            }
            
            Section(header: Text("History")) {
                HStack {
                    Label("12/5/23", systemImage: "square")
                    Spacer()
                }
                HStack {
                    Label("5/5/23", systemImage: "square.fill")
                    Spacer()
                }
            }
        }
        .toolbar {
            Button("Edit") {
                
            }
        }
    }
}




struct FriendView_Previews: PreviewProvider {
    static var friend = Friend.sampleFriends[0]
    static var previews: some View {
        FriendView(friend: friend)
    }
}
