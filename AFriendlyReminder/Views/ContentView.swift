//
//  ContentView.swift
//  AFriendlyReminder
//
//  Created by Chelsea Crawford on 26/06/2024.
//

import SwiftUI

struct ContentView: View {
    var friends = Friend.sampleFriends
    @EnvironmentObject var selectedPageState: SelectedPageState
    
    var body: some View {
        Group {
            switch selectedPageState.selectedPage {
            case .home:
                HomeView()
            case .calendar:
                CalendarView()
            case .friend:
                FriendListView(friends: friends)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SelectedPageState())
    }
}
