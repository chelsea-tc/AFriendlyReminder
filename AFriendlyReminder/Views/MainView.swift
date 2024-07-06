//
//  MainView.swift
//  AFriendlyReminder
//
//  Created by Chelsea Crawford on 28/06/2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var selectedPageState = SelectedPageState()
    
    var body: some View {
        NavigationStack {
            VStack {
                ContentView()
                FooterView()
            }
            .environmentObject(selectedPageState)
        }
    }
    
//    private var displayTitle: String {
//        switch selectedPageState.selectedPage {
//        case .home:
//            return "Home"
//        case .calendar:
//            return "Calendar"
//        case .friend:
//            return "Friend List"
//        }
//    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
