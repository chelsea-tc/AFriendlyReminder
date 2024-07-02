//
//  FriendListView.swift
//  AFriendlyReminder
//
//  Created by Chelsea Crawford on 28/06/2024.
//

import SwiftUI

struct FriendListView: View {
    var friends: [Friend]
    var body: some View {
        NavigationStack {
            List(friends) { friend in
                NavigationLink (destination: FriendView(friend: friend)) {
                    FriendCardView(name: friend.name, next: friend.next, time: friend.time, category: friend.category)
                }
                .listRowBackground(friend.category.catColor.opacity(0.3))
            }
            .toolbar {
                Button("Edit") {
                    
                }
            }
        }
    }
}



struct FriendListView_Previews: PreviewProvider {
    static var friends = Friend.sampleFriends
    static var previews: some View {
        FriendListView(friends: friends)
    }
}
